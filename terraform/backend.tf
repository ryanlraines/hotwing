terraform {
  backend "s3" {
    bucket         = "general-raines"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf_state"
  }
}