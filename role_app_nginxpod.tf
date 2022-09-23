resource "kubernetes_manifest" "role_nginxpod_role_gitlab_k8s_agent_write_nginxpod" {
  depends_on = [kubernetes_manifest.namespace_nginxpod]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-write-nginxpod"
      "namespace" = "nginxpod"
    }
    "rules" = [
      {
        "apiGroups" = [
          "*",
        ]
        "resources" = [
          "*",
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


resource "kubernetes_manifest" "rolebinding_nginxpod_rolebinding_gitlab_k8s_agent_write_binding_nginxpod" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.namespace_nginxpod,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_nginxpod_role_gitlab_k8s_agent_write_nginxpod]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-write-binding-nginxpod"
      "namespace" = "nginxpod"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-write-nginxpod"
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


resource "kubernetes_manifest" "role_nginxpod_role_gitlab_k8s_agent_read_nginxpod" {
  depends_on = [kubernetes_manifest.namespace_nginxpod]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-read-nginxpod"
      "namespace" = "nginxpod"
    }
    "rules" = [
      {
        "apiGroups" = [
          "*",
        ]
        "resources" = [
          "*",
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

resource "kubernetes_manifest" "rolebinding_nginxpod_rolebinding_gitlab_k8s_agent_read_binding_nginxpod" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.namespace_nginxpod,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_nginxpod_role_gitlab_k8s_agent_read_nginxpod]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-read-binding-nginxpod"
      "namespace" = "nginxpod"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-read-nginxpod"
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

