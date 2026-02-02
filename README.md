# Terraform AWS Web Infrastructure Project
## Overview

This project demonstrates how to provision a highly available web application infrastructure on AWS using Terraform.
It follows Infrastructure as Code (IaC) best practices and uses modular Terraform design.

The infrastructure deploys two EC2 web servers, fronted by an Application Load Balancer, with automated configuration via user data scripts.

## Technologies Used

Terraform
AWS EC2
AWS VPC
Application Load Balancer (ALB)
Amazon S3
Bash (User Data)
Git & GitHub

# Architecture Diagram
![AWS Terraform web infrastructure architecture showing VPC with public subnets across two availability zones, internet gateway, security group, two EC2 instances running Apache, and application load balancer distributing traffic with health checks](/images/aws-architecture-annotated.png)

## Architecture Explanation

1. VPC

Custom VPC with CIDR 10.0.0.0/16

2. Public Subnets

Two public subnets across different Availability Zones

Ensures high availability

3. Internet Gateway

Enables internet access for EC2 instances and ALB

4. Security Group

Allows:
- HTTP (80)
- SSH (22)

5. EC2 Instances

- Two EC2 instances running Apache
- Automatically configured using user data scripts
- Each server serves a dynamic HTML portfolio page

6. Application Load Balancer

- Distributes incoming traffic across EC2 instances
- Health checks ensure traffic is only sent to healthy servers

## Project Structure
.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── modules/
├── userdata/
├── images/
└── README.md

### User Data Automation (HTML Deployment)

- Each EC2 instance uses a user data script to:
- Install Apache
- Retrieve the EC2 instance ID
- Deploy a dynamic HTML portfolio page

### Example Output in Browser:

- Server name (Server 1 / Server 2)
- Instance ID
- Personalized welcome message

This makes it easy to verify load balancer traffic distribution.

## How to Deploy This Project
- Prerequisites
- AWS account
- AWS CLI configured
- Terraform installed
- Git installed

### Step 1: Clone the Repository
git clone https://github.com/<your-username>/terraform-aws-web-portfolio.git
cd terraform-aws-web-portfolio

### Step 2: Initialize Terraform
terraform init
![Terraform initialization process showing the command line interface with the command 'terraform init' being executed, indicating the start of the infrastructure provisioning process. ](/images/terraform-init.png)


### Step 3: Validate Configuration
terraform validate

### Step 4: Plan Deployment
terraform plan
![Terraform plan executed, displaying the planned actions for infrastructure deployment, including resource creation and modifications on AWS.](/images/terraform-plan.png)

Step 5: Apply Infrastructure
terraform apply

Type yes when prompted.

![Terraform apply successful](/images/terraform-apply-output.png)
![EC2 servers running](/images/EC2_servers_running.png)
![Application Load Balancer Target Group displaying health check status for registered EC2 instances, showing active targets with healthy status indicators in the AWS Management Console](/images/alb-target-group.png)

### Step 6: Access the Application

After deployment, Terraform outputs the ALB DNS name:

load_balancer_dns = <ALB-DNS>

Paste it into your browser.
![Dynamic HTML output page displaying the application load balancer DNS name and a personalized welcome message for users. The page features a clean layout with server information, including the server name and instance ID, set against a simple background. The overall tone is welcoming and informative, designed to enhance user experience.](/images/HTML-deployment-alb-dns-output.mp4)


## Cleanup

To destroy all resources:

terraform destroy

## Key Learning Outcomes

- Infrastructure as Code with Terraform
- Modular Terraform design
- AWS networking fundamentals
- Load balancing and high availability
- Automated EC2 configuration
- GitHub version control

## Future Improvements

- Auto Scaling Group
- HTTPS using ACM
- Remote Terraform backend (S3 + DynamoDB)
- CI/CD with GitHub Actions

## Key Highlights
- Infrastructure as Code using Terraform
- Modular Terraform architecture
- High availability using Application Load Balancer
- Automated web server provisioning with User Data
- Dynamic HTML portfolio deployment
- GitHub version control best practices
