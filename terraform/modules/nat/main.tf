resource "aws_instance" "pam_fitness_nat_instance" {
  ami                         = var.amazon_linux
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.pam_fitness_nat_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.nat_instance_key.key_name

  # Disable source/dest check (required for NAT to work)
  source_dest_check = false

  user_data = <<-EOF
    #!/bin/bash
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

    dnf install -y iptables iptables-services

    sudo iptables -t nat -A POSTROUTING -o enX0 -j MASQUERADE

    service iptables save
    systemctl enable iptables
    systemctl start iptables
  EOF

  tags = {
    Name  = "${var.project_name}_nat_instance"
  }
}

# resource "aws_ec2_instance_state" "nat_state" {
#   instance_id = aws_instance.pam_fitness_nat_instance.id
#   state       = "stopped"
# }