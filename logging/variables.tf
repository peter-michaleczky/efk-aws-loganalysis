variable "logging_namespace" {
  default = "logging"
  description = "Namespace created for all logging components"
}

variable "opensearch_host" {
  default = "opensearch-cluster-master"
  description = "OpenSearch server hostname"
}

variable "opensearch_port" {
  default = "9200"
  description = "OpenSearch server port number"
}