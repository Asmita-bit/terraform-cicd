output "ec2_instance_role_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_iam_role.ec2_role.arn
}

