resource "yandex_compute_instance" "worker" {
  name = "worker"

  resources {
    core_fraction = 20
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.k8s-subnet.id
    nat       = true
  }
     metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}