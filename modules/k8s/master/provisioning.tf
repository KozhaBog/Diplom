resource "null_resource" "docker-swarm-manager-start" {
  depends_on = [yandex_compute_instance.master]
   connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = yandex_compute_instance.master.network_interface.0.nat_ip_address
    private_key = file(var.ssh_credentials.private_key)
    }
    
 provisioner "remote-exec" {
    inline = [
      "echo COMPLETED"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${yandex_compute_instance.master.network_interface.0.nat_ip_address} >| temp; ansible-playbook -u ubuntu -i temp tree.yaml"
}
}