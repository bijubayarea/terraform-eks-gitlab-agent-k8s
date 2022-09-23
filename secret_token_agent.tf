resource "kubernetes_manifest" "secret_gitlab_k8s_agent_gitlab_k8s_agent_token" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent]
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "token" =  base64encode("${var.gitlab_agent_token}")
    }
    "kind" = "Secret"
    "metadata" = {
      "name"      = "gitlab-k8s-agent-token"
      "namespace" = "gitlab-k8s-agent"
    }
    "type" = "Opaque"
  }
}