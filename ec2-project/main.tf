resource "aws_instance" "asmita_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  # This is to force metadata v2, which mitigates role credential leakage in the event of a SSRF
	metadata_options {
		http_tokens = "required"
	}
  tags = {
    Name    = var.Name
    Creator = var.Creator
  }
}
