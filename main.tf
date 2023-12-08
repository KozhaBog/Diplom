terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.100"# Фиксируем версию провайдера
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
  name = "deploy_network"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnetmaster"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.network.id}"
  v4_cidr_blocks = ["10.2.0.0/16"]
}


module "k8s_master" {
  source                = "./modules/k8s/master"
  instance_family_image = "ubuntu-2204-lts"
  vpc_subnet_id         = yandex_vpc_subnet.subnet-1.id
}

/*
module "k8s_worker" {
  source                = "./modules/k8s/worker"
  instance_family_image = "ubuntu-2204-lts"
  vpc_subnet_id         = yandex_vpc_subnet.subnet-1.id
}

module "srv" {
  source                = "./modules/srv"
  instance_family_image = "ubuntu-2204-lts"
  vpc_subnet_id         = yandex_vpc_subnet.subnet-1.id
}
*/
output "kakoi_ip_master" {
  value = module.k8s_master.external_ip_address_vm
}
/*
output "kakoi_ip_worker" {
  value = module.k8s_worker.external_ip_address_vm
}

output "kakoi_ip_monitoring" {
  value = module.k8s_worker.external_ip_address_vm
}
*/