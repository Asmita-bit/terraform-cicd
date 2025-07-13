output "ec2_instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.this.arn
}
