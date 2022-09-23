resource "kubernetes_secret" "docker-registry" {
  depends_on = [kubernetes_manifest.namespace_website]
  metadata {
    name      = "docker-registry-key"
    namespace = "website"
  }

  data = {
    ".dockerconfigjson" = "${data.template_file.docker_config_script.rendered}"
  }

  type = "kubernetes.io/dockerconfigjson"
}


/*
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=<path/to/.docker/config.json> \
    --type=kubernetes.io/dockerconfigjson

    https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
*/