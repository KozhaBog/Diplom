terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.100" # Фиксируем версию провайдера
    }
  }
}
data "yandex_compute_image" "my_image" {
  family = var.instance_family_image
}
resource "yandex_compute_instance" "vm" {
  name = "worker"


  resources {
    core_fraction = 20
    cores  = 2
    memory = 1
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa")}"
  }
}
