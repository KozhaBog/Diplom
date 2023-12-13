terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.100"
    }
  }
}
provider "yandex" {
  token     = "<your_token>"
  cloud_id  = "<your_cloud_id>"
  folder_id = "<your_folder_id>"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "k8s-network" {
  name = "deploy_network"
}
data "yandex_compute_image" "my_image" {
  family = var.instance_family_image
}
resource "yandex_vpc_subnet" "k8s-subnet" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}
