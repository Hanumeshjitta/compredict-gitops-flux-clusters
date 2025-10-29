# compredict-gitops-flux-clusters

Kubernetes GitOps Setup with FluxCD

This repository demonstrates a complete GitOps workflow using FluxCD to manage Kubernetes resources. It includes cluster provisioning, deploying applications, monitoring, and logging.

Before starting, ensure you have the following installed:

•	kubectl (Kubernetes CLI)

•	terraform (for infrastructure provisioning and Flux bootstrapping)

•	Git (git)

•	Docker (required for Minikube or Kind if running locally)

•	Helm (optional, for installing monitoring tools)

Provisioning a Kubernetes Cluster

•	You can use either a local cluster a cloud provider AWS EKS

terraform/                   
	├─ main.tf  
	|
	├─ variables.tf  
    |
	├─ terraform.tfvars   
    |
	├─ modules/  
       ├─ vpc/ 
	   |  |
	   │  ├─ main.tf
	   |  |
	   │  ├─ variables.tf
	   |  |
	   │  └─ outputs.tf
	   |
	   ├─ eks/
	   |  |
	   │  ├─ main.tf
	   |  |
	   │  ├─ variables.tf
	   |  |
	   │  └─ outputs.tf
	   |  |
	   └─ flux-bootstrap/	
	      |
	      ├─ main.tf
	      |
	      ├─ variables.tf
	      |
	      └─ outputs.tf
	

Installing FluxCD on the Cluster

•	FluxCD is used for GitOps to automatically synchronize Kubernetes manifests from your Git repository

Steps using Terraform:

1.	Clone your repository.

2.	Configure Terraform provider for Kubernetes and Flux.

3.	Bootstrap FluxCD:

4.	Run Terraform commands:

	terraform init
	
	terraform apply

**
Configuring the Git Repository**

1.	Initialize a new repository:
Please check the  Create directories for manifests  in below repo

https://github.com/Hanumeshjitta/compredict-gitops-flux-clusters

Commit initial files:

git add .

git commit -m "Initial commit with Flux bootstrap"

git push -u origin main


**Verifying Flux Installation**
1.	Make a change in your repository (e.g., update a deployment image tag).
2.	
3.	Observe Flux applying the change automatically:
   
flux get kustomizations

kubectl get pods -n <namespace>

Deploying Applications Using Flux

1.	Commit manifests to the repository:
   
git add apps/nginx

git commit -m "Add Nginx deployment and service"

git push origin main

3.	Flux will automatically detect and apply the changes.

4.	Verify with:

kubectl get all -n default


**Setting up Monitoring**
Use Prometheus and Grafana for cluster and application monitoring.
Using Helm:
# Add Helm repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

# Install Prometheus

helm install prometheus prometheus-community/prometheus

# Install Grafana

helm install grafana grafana/grafana






