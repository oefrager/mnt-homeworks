###ssh vars
locals {
    metadata = {
        serial-port-enable = 1
        ssh-keys           = "goi:${file("~/.ssh/id_ed25519.pub")}"
    }
}
