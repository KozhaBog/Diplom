resource "yandex_compute_instance" "master" {
  name = "master"

  resources {
    cores  = 2
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size     = 9
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
