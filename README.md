# artirix-devops-technical-test-v2
This is my second answer to the test posed to me to set up infrastructure as code. This example uses ElasticSearch Serivce provided by AWS

## How it stands
* Three nodes are spun up on AWS with v5.3 ElasticSearch, 2 are masters
* ELB is not needed as this is managed by AWS
* Security group is locked to an internal range via security policy

## Things to Do
* Get Terraform to spit out the address of the cluster individually.
* Allow scaling up and down of the cluster
* Accept IP range parameter (Just nice as means it isn't hard coded)


## How to run it.
This one is nice and simple:

terraform apply

AWS credentials are pulled from the AWS cli config.