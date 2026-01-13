# Platform CLI - AWS Resource Management Tool

## What the tool does
This CLI tool allows developers to create, manage, and list AWS resources such as EC2 instances, S3 buckets, and Route53 DNS zones and records.

## Prerequisites
- Python 3.6 or later version
- AWS CLI configured with a profile and permissions
- AWS credentials managed via AWS roles/profiles
- boto3 Python package (`pip install boto3`)

## Installation
```bash
pip install -r requirements.txt


Tagging Convention

All resources created by this CLI are tagged with:

CreatedBy=platform-cli

Owner=itai

Project=<project-name> (optional, add if needed)

Environment=<environment-name> (optional, add if needed)

Cleanup Instructions

EC2 instances can be stopped or terminated using:

python3 app2.py ec2 stop --id <instance-id>
python3 app2.py ec2 delete --id <instance-id>


S3 buckets should be emptied and deleted manually via AWS Console or CLI.

Route53 zones and DNS records can be deleted using:

python3 app2.py route53 update --action delete --name <zone> --type <record-type> --system <value>


Security

No AWS secrets or credentials are stored in this repo.

AWS roles or named profiles are used for authentication.

Use environment variables or AWS CLI profiles to configure access.
