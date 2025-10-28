
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "compredict-eks-cluster"
}

variable "node_instance_type" {
  description = "Instance type for worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "desired_capacity" {
  description = "Desired node count in the node group"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "Minimum node count"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum node count"
  type        = number
  default     = 3
}

variable "ami_type" {
  description = "EKS AMI type for worker nodes (Ubuntu or Amazon Linux)"
  type        = string
  default     = "AL2_x86_64"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"
}

variable "iam_admin_user_arn" {
  description = "IAM user ARN that will be mapped to Kubernetes admin"
  type        = string
  default     = "arn:aws:iam::822653758967:user/terraform"
}


variable "github_owner" {
  description = "GitHub username or organization owning the repo"
  type        = string
  default     = "Hanumeshjitta"
}

variable "github_repo" {
  description = "GitHub repository name for Flux GitOps"
  type        = string
  default     = "compredict-gitops-flux-clusters"  
}

variable "github_branch" {
  description = "GitHub branch to sync"
  type        = string
  default     = "main"
}

variable "flux_path" {
  description = "Path in the Git repo where Flux manifests are located"
  type        = string
  #default = "clusters/compredict-eks-cluster"
  default = "clusters" 
}

variable "github_token" {
  description = "GitHub personal access token (PAT) for Flux bootstrap"
  type        = string
  sensitive   = true  
}

