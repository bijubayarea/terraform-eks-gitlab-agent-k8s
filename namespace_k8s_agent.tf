resource "kubernetes_manifest" "namespace_gitlab_k8s_agent" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = "gitlab-k8s-agent"
    }
  }
}

resource "kubernetes_manifest" "namespace_dude" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = "dude"
    }
  }
}

resource "kubernetes_manifest" "namespace_nginxpod" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = "nginxpod"
    }
  }
}

resource "kubernetes_manifest" "namespace_website" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "name" = "website"
    }
  }
}