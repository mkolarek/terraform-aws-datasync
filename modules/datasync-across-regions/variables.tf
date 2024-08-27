variable "source_bucket" {
  type        = string
  description = "Name of the source S3 bucket."
}

variable "destination_bucket" {
  type        = string
  description = "Name of the destination S3 bucket."
}

variable "shared_config_files" {
  type        = string
  description = "Path to the AWS CLI shared configuration file."
}

variable "shared_credentials_files" {
  type        = string
  description = "Path to the AWS CLI shared credentials file."
}

variable "source_profile" {
  type        = string
  description = "Profile name of the source AWS account, as defined in the shared configuration file."
}

variable "destination_profile" {
  type        = string
  description = "Profile name of the destination AWS account, as defined in the shared configuration file."
}

variable "source_region" {
  type        = string
  description = "AWS region of the source AWS account."
}

variable "destination_region" {
  type        = string
  description = "AWS region of the destination AWS account."
}


