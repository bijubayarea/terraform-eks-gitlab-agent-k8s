resource "kubernetes_manifest" "role_website_role_gitlab_k8s_agent_write_website" {
  depends_on = [kubernetes_manifest.namespace_website]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-write-website"
      "namespace" = "website"
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


resource "kubernetes_manifest" "rolebinding_website_rolebinding_gitlab_k8s_agent_write_binding_website" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
                kubernetes_manifest.namespace_website,
                kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
                kubernetes_manifest.role_website_role_gitlab_k8s_agent_write_website]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-write-binding-website"
      "namespace" = "website"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-write-website"
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


resource "kubernetes_manifest" "role_website_role_gitlab_k8s_agent_read_website" {
  depends_on = [kubernetes_manifest.namespace_website]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {
      "name"      = "role-gitlab-k8s-agent-read-website"
      "namespace" = "website"
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

resource "kubernetes_manifest" "rolebinding_website_rolebinding_gitlab_k8s_agent_read_binding_website" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
    kubernetes_manifest.namespace_website,
    kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
  kubernetes_manifest.role_website_role_gitlab_k8s_agent_read_website]
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "RoleBinding"
    "metadata" = {
      "name"      = "rolebinding-gitlab-k8s-agent-read-binding-website"
      "namespace" = "website"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind"     = "Role"
      "name"     = "role-gitlab-k8s-agent-read-website"
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