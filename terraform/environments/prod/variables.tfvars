environment                    = "prod"
region                         = "eu-west-1"
vpc_cidr                       = "10.1.0.0/16"
eks_cluster_name               = "gaming-prod-cluster"
eks_node_group_instance_type   = "t3.medium"

common_tags = {
  Terraform   = "true"
  Environment = "prod"
  Project     = "Gaming-Microservice"
}