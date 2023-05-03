terraform {
  backend "s3" {
    bucket         = "hotwing"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf_state"
  }
}