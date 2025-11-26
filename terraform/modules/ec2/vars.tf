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

variable "vpc_id" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "alb_sg_id" {}