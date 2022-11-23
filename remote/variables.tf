variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "ec2_instance_type" {
  type        = string
  description = "Amazon EC2 instance type"
  default     = "t3a.micro"
}

variable "ec2_volume_size" {
  type        = number
  description = "EBS volume size"
  default     = 10
}

variable "ec2_volume_type" {
  type        = string
  description = "EBS volume type"
  default     = "gp3"
}

variable "ec2_keypair" {
  type        = string
  description = "EC2 Keypair"
  default     = "lanandra-staging"
}

variable "ec2_instace_profile" {
  type        = string
  description = "EC2 IAM instance profile"
  default     = "ec2-admin"
}

variable "associate_public_ip" {
  type        = bool
  description = "Whether to associate public ip or not"
  default     = true
}

variable "vpc_security_group" {
  type        = string
  description = "Security group used by instance"
  default     = "sg-07c62c96b0b92924f"
}

variable "vpc_subnet" {
  type        = list(string)
  description = "Subnet used by instance"
  default     = ["subnet-08830963b41139b2b", "subnet-0ea6102b51a39ad53", "subnet-06f5236b2b35081c3"]
}

variable "detailed_monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled or not"
  default     = true
}
