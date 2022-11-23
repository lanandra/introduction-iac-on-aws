# Get latest public ubuntu AMI ID from Parameter Store in chosen region
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Reference for EC2 user-data
/*data "template_file" "user_data" {
  template = templatefile("${path.module}/user-data.sh", {msg = "user-data"})
}*/

# Setup EC2 instance using ubuntu AMI
resource "aws_instance" "ec2_lamongan_dev_demo_iac_remote" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_keypair
  iam_instance_profile        = var.ec2_instace_profile
  user_data                   = templatefile("${path.module}/user-data.sh.tpl", {file = "user-data"})
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids      = [var.vpc_security_group]
  subnet_id                   = var.vpc_subnet[1]
  monitoring                  = var.detailed_monitoring

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = var.ec2_volume_type
  }

  tags = {
    Name                   = "lamongan-dev-demo-iac-local"
    "lanandra:environment" = "demo"
    "lanandra:owner"       = "Luthfi"
  }
}
