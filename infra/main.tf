data "yandex_vpc_network" "default" {
  network_id = "enpgl7s3459939fl0suh"
}

resource "yandex_vpc_subnet" "nk-subnet-a" {
  name           = "nk-subnet-a"
  zone           = var.zone
  network_id     = data.yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.10.0.0/24"]
}

resource "yandex_iam_service_account" "k8s-sa" {
  name        = "k8s-service-account"
  description = "Service account for Managed Kubernetes cluster"
}

data "yandex_kubernetes_cluster" "nk-cluster" {
  name      = "nk-k8s-cluster"
  folder_id = var.folder_id
}

data "yandex_kubernetes_node_group" "nk-node-group" {
  name      = "nk-node-group"
  folder_id = var.folder_id
}

resource "yandex_storage_bucket" "nk-static" {
  bucket = "nk-static-bucket-ulysses43"
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
