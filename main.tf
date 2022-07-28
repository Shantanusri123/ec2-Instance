resource "aws_instance" "ec2vm" {
    ami = var.aws_ami
    instance_type = var.aws_instance
}
