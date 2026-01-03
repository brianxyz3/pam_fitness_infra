variable "project_name" {
  type        = string
  default     = "pam_fitness_app"
}

variable "amazon_linux" {
  type    = string
  default = "ami-08b6a2983df6e9e25"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_id" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "alb_sg_id" {}