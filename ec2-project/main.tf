resource "aws_instance" "asmita_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name # associate the ec2 profile with the EC2 instance
  associate_public_ip_address = true
  tags = {
    Name    = var.Name
    Creator = var.Creator
  }
  metadata_options {
		http_tokens               = "required"
	}
}

resource "aws_iam_role" "ec2_role" {
  name = "asmita_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "asmita_ec2_policy"
  path        = "/"
  description = "ec2 policy to access s3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::asmita-bucket-847984534",
          "arn:aws:s3:::asmitagupta-terraform-state-bucket"
        ]
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "asmita-test_profile"
  role =  aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.policy.arn
}

