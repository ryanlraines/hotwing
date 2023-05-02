variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "cluster_name" {
  default = "hotwing-cluster"
}

variable "s3_backend" {
  default = "general-raines"
  }

variable "state_table" {
  default = "tf_state"
}