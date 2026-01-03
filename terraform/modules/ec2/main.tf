resource "aws_instance" "frontend" {
  ami                    = var.amazon_linux
  instance_type          = var.instance_type
  subnet_id              = var.public_subnets[1]
  security_groups        = [aws_security_group.frontend_sg.id]
  key_name               = aws_key_pair.web_instance_key.key_name

  user_data = file("C:/Users/HP/portfolio/fullstack_project_portfolio/two_teir_app/pam_fitness_app/infra/terraform/modules/ec2/script/server_setup.sh")

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

  user_data = file("C:/Users/HP/portfolio/fullstack_project_portfolio/two_teir_app/pam_fitness_app/infra/terraform/modules/ec2/script/server_setup.sh")

  tags = {
    Name = "${var.project_name}-backend-app"
  }
}


resource "aws_ec2_instance_state" "web_instance_state" {
  instance_id = aws_instance.frontend.id
  state = "running"
}

resource "aws_ec2_instance_state" "app_instance_state" {
  instance_id = aws_instance.backend.id
  state = "running"
}