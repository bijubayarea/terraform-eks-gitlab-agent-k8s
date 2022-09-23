output "deploy_k8s_agent_name" {
  value = kubernetes_manifest.deployment_gitlab_k8s_agent_deploy_gitlab_k8s_agent.manifest.metadata.name
}

output "deploy_k8s_agent_namespace" {
  value = kubernetes_manifest.deployment_gitlab_k8s_agent_deploy_gitlab_k8s_agent.manifest.metadata.namespace
}

output "deploy_k8s_agent_serviceAccountName" {
  value = kubernetes_manifest.deployment_gitlab_k8s_agent_deploy_gitlab_k8s_agent.manifest.spec.template.spec.serviceAccountName
}

output "deploy_k8s_agent_token_name" {
  value = kubernetes_manifest.deployment_gitlab_k8s_agent_deploy_gitlab_k8s_agent.manifest.spec.template.spec.volumes[0].secret.secretName
}