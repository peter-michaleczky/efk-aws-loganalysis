
# for Helm set the env var KUBE_CONFIG_PATH=~/.kube/config
provider "kubernetes" {
}

module logging {
  source = "./logging"
}