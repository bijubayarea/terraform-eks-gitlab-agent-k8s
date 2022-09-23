resource "kubernetes_manifest" "serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent]
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "name"      = "sa-gitlab-k8s-agent"
      "namespace" = "gitlab-k8s-agent"
    }
  }
}