output "ec2_instance_role_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.asmita_ec2.ec2_role.arn
}

