# Summary
//TODO

# Requirements
//TODO

# Local App Start up
1. `docker build .`

1. `docker run -p 3000:3000 <imageid>`

# Terraform for Windows Users
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
