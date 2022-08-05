data "terraform_remote_state" "security_group_info"{
  backend = "s3"
  config = {
    bucket               = "terraform-state-for-us-again-gain"
    key                  = var.environment_key
    region  = var.aws_region
    profile = "aws_profile_dev"
  }
}

resource "aws_instance" "ec2vm" {
  ami = var.aws_ami
  instance_type = var.aws_instance
  vpc_security_group_ids = [data.terraform_remote_state.security_group_info.outputs.sg_id]
  tags = {
    Name = var.aws_name
  }
}


