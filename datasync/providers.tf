provider "aws" {
  shared_config_files = [var.shared_config_files]
  shared_credentials_files = [var.shared_credentials_files]
  profile = var.source_profile
  region = var.source_region
  alias = "source-profile-source-region"
}

provider "aws" {
  shared_config_files = [var.shared_config_files]
  shared_credentials_files = [var.shared_credentials_files]
  profile = var.source_profile
  region = var.destination_region
  alias = "source-profile-destination-region"
}

provider "aws" {
  shared_config_files = [var.shared_config_files]
  shared_credentials_files = [var.shared_credentials_files]
  profile = var.destination_profile
  region = var.destination_region
  alias = "destination-profile-destination-region"
}

