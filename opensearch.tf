# https://opensearch-project.github.io/helm-charts/

resource "helm_release" "opensearch" {
  repository = "https://opensearch-project.github.io/helm-charts/"
  chart      = "opensearch"
  version    = "1.2.1"
  name       = "opensearch"
}

resource "helm_release" "opensearch-dashboards" {
  repository = "https://opensearch-project.github.io/helm-charts/"
  chart      = "opensearch-dashboards"
  version    = "1.2.1"

  name       = "opensearch-dashboards"
}
