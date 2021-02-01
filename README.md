# Summary
Welcome to Hotwing! This Express/Node js app hosts a REST API. We're going to deploy hotwing to an Amazon EKS Cluster using terraform automation. 

# Prerequisites
* [Terraform](https://www.terraform.io/downloads.html)
* [AWS Account](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup)
* [AWS CLI](https://aws.amazon.com/cli/)
* [Docker](https://www.docker.com/products/docker-desktop) _for local testing_


# Run Hotwing Locally
1. `docker build .`
1. `docker run -p 3000:3000 <imageid>`

# Run Hotwing in an AWS EKS cluster
1. [Authorize AWS CLI for AWS Account](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
1. run `terraform init`
1. run `terraform apply`
1. run  `aws eks --region [region] update-kubeconfig --name [clustername]`
1. run `kubectl get svc` Notice the EXTERNAL-IP value.  Navigate to that address in your browser.

## Note for Terraform users on Windows
https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/faq.md#deploying-from-windows-binsh-file-does-not-exist

Example mod to `.terraform\modules\eks\variables.tf`:
```
variable "wait_for_cluster_cmd" {
  description = "Custom local-exec command to execute for determining if the eks cluster is healthy. Cluster endpoint will be available as an environment variable called ENDPOINT"
  type        = string
  default     = "until curl -sk $ENDPOINT >/dev/null; do sleep 4; done"
}

variable "wait_for_cluster_interpreter" {
  description = "Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy."
  type        = list(string)
  default     = ["C:\\WINDOWS\\system32\\cmd.exe", "-c"]
}
```
