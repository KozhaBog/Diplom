output "external_ip_address_master" {
  value = yandex_compute_instance.master.network_interface.0.nat_ip_address
}

output "external_ip_address_worker" {
  value = yandex_compute_instance.worker.network_interface.0.nat_ip_address
}
output "external_ip_address_srv" {
  value = yandex_compute_instance.srv.network_interface.0.nat_ip_address
}
