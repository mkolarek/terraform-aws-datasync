module "datasync-across-regions" {
    source = "../../modules/datasync-across-regions"
    source_bucket = "tf-module-datasync-mkolarek-development"
    destination_bucket = "tf-module-datasync-mkolarek-production"
    shared_config_files = "/home/marko/.aws/config"
    shared_credentials_files = "/home/marko/.aws/credentials"
    source_profile = "Development"
    source_region = "eu-west-1"
    destination_profile = "Production"
    destination_region = "eu-central-1"
}
