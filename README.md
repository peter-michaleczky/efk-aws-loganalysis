# efk-aws-loganalysis

Setup an EFK cluster in Kubernetes cluster (minikube). The cluster is configured with terraform and helm. 
Fluent-bit collects the logs from the Kubernetes ecosystem and the application components, and pushes to OpenSearch.  

## Setup Kubernetes cluster locally

### Prerequisites

- Docker Desktop (give 8 GB MB memory and 2 CPUs to Docker at least!)
- Follow [this guide](https://minikube.sigs.k8s.io/docs/start/) to install minikube on macOS:
- Install [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform)
- Install [helm](https://helm.sh/docs/intro/install/#through-package-managers)

```
brew install minikube
```

### Create K8 cluster

Download Kubernetes images and start a cluster locally on Docker: 
`minikube start`

Verify the cluster is running:
`kubectl get pods --all-namespaces`

### Open Kubernetes dashboard

`minikube dashboard`

## Deploy with terraform

The `terraform apply` command creates:
- fluent-bit daemon set which creates a log collector pod in every node
- fluent-bit operators to configure the inputs, parsers and outputs via terraform code
- OpenSearch nodes and service
- OpenSearch Dashboards service

## Setup integration and index pattern in OpenSearch Dashboard

- add a new index pattern for ks-logstash-log*, set timestamp field
- add Logstash integration
- go to Discover and you should see the log events

## Accessing the apps

To access OpenSearch Dashboards via tunneling:
`minikube service opensearch-dashboard`

## Troubleshooting

### Verifying services in the cluster

Running busybox.sh script will create a temporary linux pod, and you will get a bash console.

Useful commands:
- `printenv` to learn service IPs and ports
- use `wget` to make http calls
- `nslookup` to check hostnames (`nslookup opensearch-cluster-master`)

### Verifying exposed ports and endpoints

To get the exposed port and internal mapping (IPs, target ports, protocol) of frontend service:

`kubectl get service opensearch-dashboards -o json`

Get endpoints:

`kubectl get endpoints opensearch-dashboards`


