
resource "kubernetes_manifest" "role_dude_role_gitlab_k8s_agent_write_dude" {
  depends_on = [kubernetes_manifest.namespace_dude]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-write-dude"
      "namespace" = "dude"
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


resource "kubernetes_manifest" "rolebinding_dude_rolebinding_gitlab_k8s_agent_write_binding_dude" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.namespace_dude,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_dude_role_gitlab_k8s_agent_write_dude]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-write-binding-dude"
      "namespace" = "dude"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-write-dude"
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


resource "kubernetes_manifest" "role_dude_role_gitlab_k8s_agent_read_dude" {
  depends_on = [kubernetes_manifest.namespace_dude]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-read-dude"
      "namespace" = "dude"
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

resource "kubernetes_manifest" "rolebinding_dude_rolebinding_gitlab_k8s_agent_read_binding_dude" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
    kubernetes_manifest.namespace_dude,
    kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
  kubernetes_manifest.role_dude_role_gitlab_k8s_agent_read_dude]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-read-binding-dude"
      "namespace" = "dude"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-read-dude"
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

