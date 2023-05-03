terraform {
  backend "s3" {
    bucket         = "general-raines"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf_state"
  }
}