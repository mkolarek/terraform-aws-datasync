# datasynce

A simple terraform module that facilitates migrating data between two S3 buckets, located in two different AWS accounts, across two different regions.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.destination-profile-destination-region"></a> [aws.destination-profile-destination-region](#provider\_aws.destination-profile-destination-region) | 5.58.0 |
| <a name="provider_aws.source-profile-destination-region"></a> [aws.source-profile-destination-region](#provider\_aws.source-profile-destination-region) | 5.58.0 |
| <a name="provider_aws.source-profile-source-region"></a> [aws.source-profile-source-region](#provider\_aws.source-profile-source-region) | 5.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.datasync-task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_datasync_location_s3.destination-location](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/datasync_location_s3) | resource |
| [aws_datasync_location_s3.source-location](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/datasync_location_s3) | resource |
| [aws_datasync_task.mongodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/datasync_task) | resource |
| [aws_iam_role.datasync-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_s3_bucket_policy.destination_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |
| [aws_s3_bucket.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_bucket"></a> [destination\_bucket](#input\_destination\_bucket) | Name of the destination S3 bucket. | `string` | n/a | yes |
| <a name="input_destination_profile"></a> [destination\_profile](#input\_destination\_profile) | Profile name of the destination AWS account, as defined in the shared configuration file. | `string` | n/a | yes |
| <a name="input_destination_region"></a> [destination\_region](#input\_destination\_region) | AWS region of the destination AWS account. | `string` | n/a | yes |
| <a name="input_shared_config_files"></a> [shared\_config\_files](#input\_shared\_config\_files) | Path to the AWS CLI shared configuration file. | `string` | n/a | yes |
| <a name="input_shared_credentials_files"></a> [shared\_credentials\_files](#input\_shared\_credentials\_files) | Path to the AWS CLI shared credentials file. | `string` | n/a | yes |
| <a name="input_source_bucket"></a> [source\_bucket](#input\_source\_bucket) | Name of the source S3 bucket. | `string` | n/a | yes |
| <a name="input_source_profile"></a> [source\_profile](#input\_source\_profile) | Profile name of the source AWS account, as defined in the shared configuration file. | `string` | n/a | yes |
| <a name="input_source_region"></a> [source\_region](#input\_source\_region) | AWS region of the source AWS account. | `string` | n/a | yes |

## Outputs

No outputs.
