variable "name" { 
    type = string 
    }
variable "cluster_name" { 
    type = string
     }
variable "subnet_ids" { 
    type = list(string) 
    }

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "desired_size" {  #at that time of creation 4 worker nodes will be creating
  type    = number
  default = 2
}
variable "max_size" { 
  type = number 
  default = 3
  }
variable "min_size" {
 type = number 
 default = 1
 
 }

variable "account_id" {
  default = "822653758967"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}