data "terraform_remote_state" "security_group_info"{
  backend = "s3"
  config = {
    bucket               = "terraform-state-for-us"
    key                  = "var.environment_key-terraform-state/terraform.tfstate"
    region  = var.aws_region
    profile = "aws_profile_dev"
  }
}

resource "aws_instance" "ec2vm" {
  ami = var.aws_ami
  instance_type = var.aws_instance
  security_groups = [data.terraform_remote_state.security_group_info.outputs.sg_id.value]
  tags = {
    Name = var.aws_name
  }
}


