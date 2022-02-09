# efk-aws-loganalysis

Configure EFK cluster locally for loganalysis.  

## Setup Kubernetes cluster locally

### Prerequisites

- Docker Desktop
- Follow [this guide](https://minikube.sigs.k8s.io/docs/start/) to install minikube on macOS:

```
brew install minikube
```

### Create K8 cluster

Download Kubernetes images and start a cluster locally on Docker: 
`minikube start`

Verify the cluster is running:
`kubectl get pods --all-namespaces`

## Open Kubernetes dashboard

`minikube dashboard`

## Deploy FluentBit DaemonSet

Follow [this guide](https://github.com/fluent/fluent-bit-kubernetes-logging) to deploy FluentBit as a DaemonSet on the local cluster.

1/ Create logging namespace

`kubectl create namespace logging`

2/ Create service account and role for Fluent Bit

```bash
kubectl create -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-service-account.yaml
kubectl create -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-role-1.22.yaml
kubectl create -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-role-binding-1.22.yaml
```

3/ Create a ConfigMap used by the daemonset

`kubectl create -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/output/elasticsearch/fluent-bit-configmap.yaml`

4/ Create the daemon set (for minikube in this example)

`kubectl create -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/output/elasticsearch/fluent-bit-ds-minikube.yaml`

Verify that the daemon set appears in the dashboard.

For production, it's better to build your own Fluent Bit daemon set configuration. Check the above [YAML files in 
Fluent Bit's github repo](https://github.com/fluent/fluent-bit-kubernetes-logging/blob/master/output/elasticsearch/fluent-bit-configmap.yaml) 
as an example!

### Hello-node

```
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
minikube service hello-minikube
```
