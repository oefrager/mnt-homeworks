output "webservers" {
  value = [for i in yandex_compute_instance.host : {
    name  = i.name
    id    = i.network_interface[0].nat_ip_address
  }]
}
