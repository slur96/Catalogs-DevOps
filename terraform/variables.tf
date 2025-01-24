variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment (staging/prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "Gaming-Microservice"
  }
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "eks_node_group_instance_type" {
  description = "Instance type for EKS node group"
  type        = string
  default     = "t3.medium"
}