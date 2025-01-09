module "dev-app" {
  source = "./aws_infra"
  my_env="dev"
  instance_type = "t2.micro"
  ami_id = "ami-053b12d3152c0cc71"
  instance_count = 1
}

module "Staging" {
  source = "./aws_infra"
  my_env="Stage"
  instance_type = "t2.micro"
  ami_id = "ami-053b12d3152c0cc71"
  instance_count = 1
}

module "production-app" {
  source = "./aws_infra"
  my_env="prod"
  instance_type = "t2.micro"
  ami_id = "ami-053b12d3152c0cc71"
  instance_count = 1
}