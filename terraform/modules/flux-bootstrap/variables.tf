
variable "kubeconfig_path" {
  description = "Path to the kubeconfig file for the EKS cluster"
 type = string
 default = "modules/eks/kubeconfig_compredict-eks-cluster"

}


variable "github_owner" {
  description = "GitHub owner/org"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "Git branch"
  type        = string
  default     = "main"
}

variable "flux_path" {
  description = "Path inside repo to deploy Flux manifests"
  type        = string
  #default = "clusters/compredict-eks-cluster" 
  default = "clusters" 
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

