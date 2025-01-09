variable "my_env" {
  description = "This is the environment for infra"
  type=string
}

variable "ami_id" {
  description = "This is the AMI Id for EC2"
  type=string
}

variable "instance_type" {
  description = "This is the type of instance for EC2"
    type=string
}

variable "instance_count"{
    description = "This is the count for the instance in EC2"
    type=number
}