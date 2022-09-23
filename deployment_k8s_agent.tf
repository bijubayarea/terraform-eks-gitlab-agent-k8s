resource "kubernetes_manifest" "deployment_gitlab_k8s_agent_deploy_gitlab_k8s_agent" {
  depends_on = [kubernetes_manifest.namespace_gitlab_k8s_agent,
    kubernetes_manifest.serviceaccount_gitlab_k8s_agent_sa_gitlab_k8s_agent,
  kubernetes_manifest.secret_gitlab_k8s_agent_gitlab_k8s_agent_token]
  manifest = {
    "apiVersion" = "apps/v1"
    "kind"       = "Deployment"
    "metadata" = {
      "name"      = "deploy-gitlab-k8s-agent"
      "namespace" = "gitlab-k8s-agent"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "gitlab-k8s-agent"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge"       = 0
          "maxUnavailable" = 1
        }
        "type" = "RollingUpdate"
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "gitlab-k8s-agent"
          }
          "namespace" = "gitlab-k8s-agent"
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--token-file=/config/token",
                "--kas-address",
                "wss://kas.gitlab.com",
              ]
              "image" = "registry.gitlab.com/gitlab-org/cluster-integration/gitlab-agent/agentk:stable"
              "name"  = "agent"

              "env" = [
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },

                {
                  "name" = "POD_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.name"
                    }
                  }
                },

              ]

              "volumeMounts" = [
                {
                  "mountPath" = "/config"
                  "name"      = "token-volume"
                },
              ]
            },
          ]
          "serviceAccountName" = "sa-gitlab-k8s-agent"
          "volumes" = [
            {
              "name" = "token-volume"
              "secret" = {
                "secretName" = "gitlab-k8s-agent-token"
              }
            },
          ]
        }
      }
    }
  }
}