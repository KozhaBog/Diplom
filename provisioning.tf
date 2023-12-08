resource "null_resource" "connecton_k8s_master" {
  depends_on = [yandex_compute_instance.master]
   connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = yandex_compute_instance.master.network_interface.0.nat_ip_address
    private_key = file(var.ssh_credentials.private_key)
    }
    
 provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sleep 10"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${yandex_compute_instance.master.network_interface.0.nat_ip_address} >| temp; ansible-playbook -u ubuntu -i temp tree.yaml; ansible-playbook -u ubuntu -i temp kube-dependencies.yml"
}
}