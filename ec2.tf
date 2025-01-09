#Create a Key Pair for Instance

resource "aws_key_pair" "deployer"{
    key_name = "terra-key"
    public_key = file("E:/Terraform_project/terra-key.pub")
}

#Default VPC
resource "aws_default_vpc" "default" {
  
}

#Security
resource "aws_security_group" "zaidsecurity" {
    name="allow ports"
    description="this SG is to open PORT for EC2 instance"
    vpc_id=aws_default_vpc.default.id #interpolation
  
    ingress {
        description = "This is for SSH"
        from_port = 22
        to_port=22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "This is for outgoing internet"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my-instance" {
    ami=var.ami_id #ubuntu
    instance_type="t2.micro" #free tier
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.zaidsecurity.name]
    tags={
        Name:"terra-automate" #name
    }
}