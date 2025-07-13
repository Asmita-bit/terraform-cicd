resource "aws_instance" "asmita_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = merge(
    local.common_tags,
    {
      Name = local.ec2_name
    }
  )
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    echo "<html><body><h1>Hello this is module instance_template (NGINX)</h1></body></html>" | sudo tee /var/www/html/index.nginx-debian.html
    EOF
}

