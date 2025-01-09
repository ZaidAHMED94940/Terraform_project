resource "aws_instance" "my-instance" {
    ami=var.ami_id #ubuntu
    instance_type=var.instance_type #free tier
    tags={
        Name:"${var.my_env}terra-automate" #name
    }
}