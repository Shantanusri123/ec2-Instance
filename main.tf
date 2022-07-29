data "terraform_remote_state" "security_group_info"{
  backend = "s3"
  config = {
    bucket               = "terraform-state-for-us"
    key                  = "dev-terraform-state/terraform.tfstate"
    region  = var.region
    profile = "aws_profile_dev"
  }
  
}

resource "aws_instance" "ec2vm" {
  ami = var.aws_ami
  instance_type = var.aws_instance
  security_groups = [data.dev-terraform-state.security_group_info.outputs.
  tags = {
    Name = var.aws_name
  }
}


