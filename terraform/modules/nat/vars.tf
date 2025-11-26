variable "project_name" {
  type        = string
  default     = "pam_fitness_app"
}

variable "amazon_linux" {
  type    = string
  default = "ami-091a906f2e1e40076"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {}
variable "public_subnets" {}
