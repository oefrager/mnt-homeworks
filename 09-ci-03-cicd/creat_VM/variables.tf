###cloud vars
#variable "token" {
#  type        = string
# description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable  "vm_image" {
  type        = string
#  default     = "fd8gdrfaftkcaarp40fe"
  default     = "centos-7-oslogin"
  description = "CentOS 7 release name"
}

###VM BD vars
variable "vms_resources_host" {
  type = map(object({
    name           = string
    hostname       = string
    platform_id    = string
    disk_volume    = number
    cores          = number
    memory         = number
    core_fraction  = number
  }))
  default = {
    sonar-01 = {
      name           = "sonar-01"
      hostname       = "sonar-01"
      platform_id    = "standard-v3"
      disk_volume    = 10
      cores          = 2
      memory         = 4
      core_fraction  = 20
    },
    nexus-01 = {
      name           = "nexus-01"
      hostname       = "nexus-01"
      platform_id    = "standard-v3"
      disk_volume    = 10
      cores          = 2
      memory         = 4
      core_fraction  = 20
    }
  }
}
