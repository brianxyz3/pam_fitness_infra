resource "aws_instance" "frontend" {
  ami                    = var.amazon_linux
  instance_type          = var.instance_type
  subnet_id              = var.public_subnets[0]
  security_groups        = [aws_security_group.frontend_sg.id]
  key_name               = aws_key_pair.web_instance_key.key_name

  # user_data = file("script/server_setup.sh")

  tags = {
    Name = "${var.project_name}-frontend-app"
  }
}

resource "aws_instance" "backend" {
  ami                    = var.amazon_linux
  instance_type          = var.instance_type
  subnet_id              = var.private_subnets[0]
  security_groups        = [aws_security_group.backend_sg.id]
  key_name               = aws_key_pair.web_instance_key.key_name

  # user_data = file("script/server_setup.sh")

  tags = {
    Name = "${var.project_name}-backend-app"
  }
}
