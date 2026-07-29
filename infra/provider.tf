terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.95"
    }
  }
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket     = "nk-tfstate-ulysses43"
    key        = "infra/terraform.tfstate"
    region     = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation  = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}

provider "yandex" {
  service_account_key_file = pathexpand("~/yc-keys/terraform-sa-key.json")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
