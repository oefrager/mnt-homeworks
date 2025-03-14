resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "local_file" "ansible_inventory" {
  content = templatefile("./hosts.tftpl", {
    sonar_ip = yandex_compute_instance.host["sonar-01"].network_interface[0].nat_ip_address,
    nexus_ip = yandex_compute_instance.host["nexus-01"].network_interface[0].nat_ip_address
  })
  filename = "./infrastructure/inventory/cicd/hosts.yml"
}
