resource "aws_instance" "asmita_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  tags = {
    Name    = var.Name
    Creator = var.Creator
  }
}
