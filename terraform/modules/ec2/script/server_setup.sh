#!/bin/bash
yum update -y
yum install -y docker git
# service docker start
# docker run -d -p 8000:8000 my-backend-image:latest
