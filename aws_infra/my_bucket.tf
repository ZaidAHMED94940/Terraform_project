resource "aws_s3_bucket" "my-testinhf-bucket" {
    bucket="${var.my_env}my-testinhf-bucket"
    tags={
        Name = "${var.my_env}Testing-bucket"
        environment=var.my_env
    }
}