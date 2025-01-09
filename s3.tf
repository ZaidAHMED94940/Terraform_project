resource "aws_s3_bucket" "my-testinhf-bucket" {
    bucket="my-testinhf-bucket"
    tags={
        Name = "Testing-bucket"
    }
}