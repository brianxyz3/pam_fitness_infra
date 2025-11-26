resource "aws_ecr_repository" "frontend_repo" {

  name = "${var.project_name}_frontend"

  image_scanning_configuration {
    scan_on_push = true
  }
  

  tags = {
    Name = "${var.project_name}_frontend_repo"
  }
}

resource "aws_ecr_repository" "backend_repo" {

  name = "${var.project_name}_backend"

  image_scanning_configuration {
    scan_on_push = true
  }
  

  tags = {
    Name = "${var.project_name}_backend_repo"
  }
}

# Create a lifecycle policy resource per repository

resource "aws_ecr_lifecycle_policy" "frontend_repo_policy" {

  repository = aws_ecr_repository.frontend_repo.name
  

  policy = <<POLICY
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
POLICY
}


resource "aws_ecr_lifecycle_policy" "backend_repo_policy" {

  repository = aws_ecr_repository.backend_repo.name
  

  policy = <<POLICY
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
POLICY
}