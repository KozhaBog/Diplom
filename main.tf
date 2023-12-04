terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.91.0" # Фиксируем версию провайдера
    }
  }
}
provider "yandex" {
  token     = "y0_AgAAAAAUGMM5AATuwQAAAADj5p1NwZol4arwRKKQIWj-DWzJPP9lYqg"
  cloud_id  = "b1gb0d8kokqae5noef7s"
  folder_id = "b1g07boj4j03d4ln6dhf"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network" {
  name = "deploy-network"
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}