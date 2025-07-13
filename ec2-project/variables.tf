variable "aws_region"{
  description = "Region where instace recides"
}
variable "ami_id" {
  description = "Amazon Machine Image I"
  type = string
}
variable "instance_type" {
  description = "Instance type"
  type = string
}

variable "Name" {
  description ="Resource name"
  type = string
}
variable "Creator" {
  description ="Resource Creator"
  type = string
}

