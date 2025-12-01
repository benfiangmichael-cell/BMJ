provider "null" {}

resource "null_resource" "create_users" {
  provisioner "local-exec" {
    command = "bash ../1-Script-Bash/create_users.sh"
  }
}
