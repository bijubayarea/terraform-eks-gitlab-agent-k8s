data "template_file" "docker_config_script" {
  template = file("${path.module}/docker_login_config.json")
  vars = {
    docker-username = "${var.docker-username}"
    docker-password = "${var.docker-password}"
    docker-server   = "${var.docker-server}"
    docker-email    = "${var.docker-email}"
    auth            = base64encode("${var.docker-username}:${var.docker-password}")
  }
}