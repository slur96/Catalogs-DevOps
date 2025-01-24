environment                    = "staging"
region                         = "us-west-2"
vpc_cidr                       = "10.0.0.0/16"
eks_cluster_name               = "gaming-staging-cluster"
eks_node_group_instance_type   = "t3.medium"

common_tags = {
  Terraform   = "true"
  Environment = "staging"
  Project     = "Gaming-Microservice"
}