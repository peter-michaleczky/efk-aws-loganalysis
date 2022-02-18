#helm install fluentbit-operator  --create-namespace -n kubesphere-logging-system charts/fluentbit-operator/ --set containerRuntime=docker

resource "helm_release" "fluentbit-operator" {
  chart      = "${path.module}/fluentbit-operator-0.12.0/charts/fluentbit-operator"
  version    = "0.1.0"

  name             = "fluentbit-operator"
  namespace        = var.logging_namespace
  create_namespace = true
  cleanup_on_fail  = true
}