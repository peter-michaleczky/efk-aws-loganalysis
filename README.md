# efk-aws-loganalysis

Configure EFK cluster locally for loganalysis.  

## Setup Kubernetes cluster locally

### Prerequisites

- Docker Desktop (give 8 GB MB memory and 2 CPUs to Docker at least!)
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

## Deploy using YAML file

To create loging namespace and all services in the cluster, execute the following command:

`kubectl apply -k .`

For details see the comments in [kustomization.yaml](kustomization.yaml)!

## Accessing the apps

To access the frontend via tunneling:
`minikube -n logging service frontend`

## Troubleshooting

### Verifying services in the cluster

Running busybox.sh script will create a temporary linux pod, and you will get a bash console.

Useful commands:
- `printenv` to learn service IPs and ports
- use `wget` to make http calls
- `nslookup` to check hostnames (`nslookup elasticsearch`)

## Verifying exposed ports and endpoints

To get the exposed port and internal mapping (IPs, target ports, protocol) of frontend service:

`kubectl get service -n logging frontend -o json`

Get endpoints:

`kubectl get endpoints -n logging frontend`


