# Summary
Welcome to Hotwing! This Express/Node js app hosts a REST API. We're going to deploy hotwing to an Amazon EKS Cluster using terraform automation. 

# Prerequisites
* [Terraform](https://www.terraform.io/downloads.html)
* [AWS Account](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?nc2=h_ct&src=header_signup)
* [AWS CLI](https://aws.amazon.com/cli/)
* [Docker](https://www.docker.com/products/docker-desktop) _for local deployment using docker_


# Hotwing Locally
Want to run hotwing locally in a docker container? This is espescially useful for rapid development.
1. `docker build .`
1. `docker run -p 80:80 <imageid>`

# Hotwing in an AWS EKS cluster
1. Lets move to the terraform directory, run `cd ./terraform`
1. [Authorize AWS CLI for AWS Account](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
After you've installed AWS CLI, lets connect it to your AWS account where you wish to deploy hotwing. 

1. run `terraform init`
    * Windows users see notes below
1. run `terraform apply`
1. run  `aws eks --region us-east-1 update-kubeconfig --name hotwing-cluster`
1. run `kubectl get svc` Notice the EXTERNAL-IP value.  Navigate to that address in your browser.

## Note for Terraform users on Windows
If you're running Terraform from a windows host, there will be some edits to the module files required. 
1. Modify the interpreter location
    
    https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/faq.md#deploying-from-windows-binsh-file-does-not-exist

    Example mod to `terraform\.terraform\modules\eks\variables.tf`:
    ```
    variable "wait_for_cluster_interpreter" {
      description = "Custom local-exec command line interpreter for the command to determining if the eks cluster is healthy."
      type        = list(string)
      default     = ["C:\\WINDOWS\\system32\\cmd.exe", "-c"]
    }
    ```
1. Modify Volume Type

    Example mod to `terraform\.terraform\modules\eks\local.tf`
    ```
    root_volume_type              = "gp2"
    ```

# Hotwing Cleanup
If you're ready to cleanup your environment, run this command.  Terraform will destroy all the resources it's managing.

1. run `terraform destroy`

# So how is all this working?

# Testing
The easiest way to test hotwing is to naviate to the external-ip.You should see something like this: 

![Sample Browser](assets\sample_browser.png)

But suppose you had many API endpoints to test, or you wanted to test API performance; manually testing in the browser isn't optimal. The easiest automated testing could be accomplished with cURL.  

Example:
`curl af5177e41ef1f4b42841138742cebce8-1348202060.us-east-1.elb.amazonaws.com`

![Sample cURL](assets\curl.gif)

