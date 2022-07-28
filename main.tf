resource "aws_instance" "ec2vm" {
    name = var.aws_name
    ami = var.aws_ami
    instance_type = var.aws_instance
    security_group = var.aws_sg
}
