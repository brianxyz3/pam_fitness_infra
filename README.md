# pam_fitness_infra

Pam fitness project

📌 Project Overview
Pam Fitness consists of a React-based frontend and a FastAPI backend, deployed as containerized services on AWS EC2. The architecture emphasizes security by isolating the backend in a private subnet while exposing the frontend through a public interface, all orchestrated behind an Application Load Balancer.
Continuous integration and delivery pipelines are implemented using Jenkins to automate builds, tests, and deployments.

🏗️ Architecture Overview
High-level design:
* Public-facing React application
* Private FastAPI backend API
* Application Load Balancer (ALB) for traffic routing
* NAT EC2 instance for controlled outbound internet access
* Network isolation using public and private subnets
* Automated CI/CD with Jenkins
🔹 Components
Frontend (Public Web Server)
* React application
* Containerized and deployed on an EC2 instance
* Hosted in a public subnet
* Accessible to end users via the internet
* Doubles as a bastion host to facilitate bastion jump to app server in private subnet.
Backend (Private Application Server)
* FastAPI application
* Containerized and deployed on an EC2 instance
* Hosted in a private subnet
* Not directly exposed to the internet
* Receives traffic only through the ALB
Application Load Balancer
* Routes incoming requests to the backend service
* Acts as a security and traffic management layer
* Enables scalability and health checks
NAT EC2 Instance
* Provides outbound internet access for private subnet resources
* Allows backend services to fetch updates or external dependencies securely
* Prevents inbound internet access to private resources
CI/CD Pipeline (Jenkins)
* Automates build, test, and deployment of frontend and backend containers
* Integrates with GitHub for source code management
* Ensures fast and consistent deployments to AWS EC2 instances
* Provides rollback capabilities for safer releases

🔐 Security Design
* Backend services fully isolated in a private subnet
* No direct internet access to the API layer
* Controlled ingress via ALB
* Outbound-only internet access through NAT instance
* Separation of concerns between public and private resources
* CI/CD pipeline uses secure credentials and environment variables

🛠️ Technology Stack
Frontend
* React
* Docker
* EC2 (Public Subnet)
Backend
* FastAPI
* Python
* Docker
* EC2 (Private Subnet)
Cloud & Infrastructure
* AWS EC2
* Auto Scaling Group
* Application Load Balancer
* VPC (Public & Private Subnets)
* NAT EC2 Instance
* CloudWatch
CI/CD
* Jenkins for automated build, test, and deployment
* GitHub webhook to trigger Jenkins pipeline.

🚀 Key Engineering Highlights
* Containerized frontend and backend services
* Secure VPC design with subnet isolation
* Load-balanced backend traffic
* NAT-based outbound access for private services
* Automated CI/CD pipelines with Jenkins
* Designed with scalability and production patterns in mind

📈 Future Improvements
* Replace bastion SSH with SSM Session Manager and IAM roles.
* Convert frontend to S3 + CloudFront (for improved performance & lower cost).
*	Evaluate migration to ECS Fargate for fully managed container runtime when scaling becomes a priority
* Replace NAT EC2 with AWS NAT Gateway
* Integrate Jenkins with GitHub Actions for hybrid pipelines
* Add HTTPS with ACM and domain routing

📄 Summary
Pam Fitness demonstrates how to design and deploy a secure, cloud-native full-stack application on AWS with automated CI/CD. The project focuses on real-world infrastructure decisions, clean separation of concerns, production-ready architecture, and automated deployments for faster delivery.
