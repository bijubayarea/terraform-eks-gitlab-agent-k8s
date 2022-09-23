resource "kubernetes_manifest" "role_gitlab_k8s_agent_role_gitlab_k8s_agent_write" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-write"
      "namespace" = "gitlab-k8s-agent"
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


resource "kubernetes_manifest" "rolebinding_gitlab_k8s_agent_rolebinding_gitlab_k8s_agent_write" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_gitlab_k8s_agent_role_gitlab_k8s_agent_write]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-write"
      "namespace" = "gitlab-k8s-agent"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-write"
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

resource "kubernetes_manifest" "role_gitlab_k8s_agent_role_gitlab_k8s_agent_read" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-read"
      "namespace" = "gitlab-k8s-agent"
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


resource "kubernetes_manifest" "rolebinding_gitlab_k8s_agent_rolebinding_gitlab_k8s_agent_read" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_gitlab_k8s_agent_role_gitlab_k8s_agent_read]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-read"
      "namespace" = "gitlab-k8s-agent"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-read"
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