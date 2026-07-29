variable "yc_token" {
  type = string
}
variable "cloud_id" {
  type = string
}
variable "folder_id" {
  type = string
}
variable "zone" {
  default = "ru-central1-a"
}
variable "s3_access_key" {
  type = string
}
variable "s3_secret_key" {
  type = string
}
variable "cluster_name" {
  default = "nk-k8s-cluster"
}
