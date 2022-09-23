resource "kubernetes_manifest" "clusterrole_gitlab_k8s_agent_write_cm" {

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRole"
    "metadata" = {
      "name" = "clusterrole-gitlab-k8s-agent-write-cm"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
          "services"
        ]
        "verbs" = [
          "create",
          "update",
          "delete",
          "patch",
        ]
      },
    ]
  }
}


resource "kubernetes_manifest" "clusterrolebinding_gitlab_k8s_agent_write_cm" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
    kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
  kubernetes_manifest.clusterrole_gitlab_k8s_agent_write_cm]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRoleBinding"
    "metadata" = {
      "name" = "clusterrolebinding-gitlab-k8s-agent-write-cm"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "ClusterRole"
      "name"     = "clusterrole-gitlab-k8s-agent-write-cm"
    }
    "subjects" = [
      {
        "kind"      = "ServiceAccount"
        "name"      = "sa-gitlab-k8s-agent"
        "namespace" = "gitlab-k8s-agent"
      },
    ]
  }
}


resource "kubernetes_manifest" "clusterrole_gitlab_k8s_agent_read_cm" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRole"
    "metadata" = {
      "name" = "clusterrole-gitlab-k8s-agent-read-cm"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
          "namespaces",
          "services"
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },

      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "deployments"
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}


resource "kubernetes_manifest" "clusterrolebinding_gitlab_k8s_agent_read_cm" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
    kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
  kubernetes_manifest.clusterrole_gitlab_k8s_agent_read_cm]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "ClusterRoleBinding"
    "metadata" = {
      "name" = "clusterrolebinding-gitlab-k8s-agent-read-cm"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "ClusterRole"
      "name"     = "clusterrole-gitlab-k8s-agent-read-cm"
    }
    "subjects" = [
      {
        "kind"      = "ServiceAccount"
        "name"      = "sa-gitlab-k8s-agent"
        "namespace" = "gitlab-k8s-agent"
      },
    ]
  }
}