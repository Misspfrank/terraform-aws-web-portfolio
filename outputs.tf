output "load_balancer_dns" {
  description = "Public DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "alb_public_dns" {
  description = "The DNS address of the Load Balancer"
  value       = module.alb.alb_dns
}

output "web_server_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.instance_public_ips
}
