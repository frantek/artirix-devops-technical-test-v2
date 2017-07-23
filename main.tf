# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_elasticsearch_domain" "es" {
  domain_name           = "tf-test-deploy"
  elasticsearch_version = "5.3"
  cluster_config {
    instance_type = "t2.micro.elasticsearch"
	instance_count = 3
	dedicated_master_enabled = true
	dedicated_master_count = 2
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {
                "IpAddress": {"aws:SourceIp": ["10.0.1.0/24"]}
            }
        }
    ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Domain = "TestTerraformDomain"
  }
}