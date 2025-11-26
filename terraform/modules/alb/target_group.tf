resource "aws_lb_target_group" "frontend_tg" {
  name        = "${var.project_name}-frontend-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-frontend-tg"
  }
}

resource "aws_lb_target_group" "backend_tg" {
  name        = "${var.project_name}-backend-tg"
  port        = 8000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-backend-tg"
  }
}

# Register EC2 Instances to Target Groups

resource "aws_lb_target_group_attachment" "frontend_ec2_attach" {
  target_group_arn = aws_lb_target_group.frontend_tg.arn
  target_id        = var.frontend_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "backend_ec2_attach" {
  target_group_arn = aws_lb_target_group.backend_tg.arn
  target_id        = var.backend_id
  port             = 8000
}
