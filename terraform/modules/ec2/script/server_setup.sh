#!/bin/bash
yum update -y
yum install -y docker
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker
# docker run -d -p 8000:8000 my-backend-image:latest
