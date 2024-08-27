# Example with two accounts across two regions

The following example creates all the necessary AWS DataSync resources, along with S3 bucket policies, IAM roles, and CloudWatch logs.

## Usage

This module (and therefore this example) depend on pre-existing S3 buckets in the source and destination accounts. This is by design, since we do not want to tie-in the life cycle of the S3 buckets to the DataSync resources, in case we're performing a one-off migration.

To run this example you need to execute:

```terraform
$ terraform init
$ terraform plan
$ terraform apply
```
