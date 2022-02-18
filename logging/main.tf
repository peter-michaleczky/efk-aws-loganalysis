resource "helm_release" "fluentbit-operator" {
  chart      = "${path.module}/fluentbit-operator-0.12.0/charts/fluentbit-operator"
  version    = "0.1.0"

  name             = "fluentbit-operator"
  namespace        = var.logging_namespace
  create_namespace = true
  cleanup_on_fail  = true

  set {
    name = "Kubernetes"
    value = true
  }

  set {
    # enable OpenSearch (or ElasticSearch) server as an output
    name = "output\\.es"
    value = yamlencode({
      enable: true
      host: var.opensearch_host
      port: var.opensearch_port
    })
  }
}