variable "dynamo_table_name" {
  type=string
  default="dynamodb"
  description = "this is table name for DynamoDb"
}

variable "ami_id" {
    type=string
    default = "ami-053b12d3152c0cc71"
    description="This is ami id for ec2"
}