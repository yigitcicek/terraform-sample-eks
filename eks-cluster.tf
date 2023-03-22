module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "19.10.1"

    cluster_name = "myapp-eks-cluster"
    cluster_version = "1.25"

    subnet_ids = module.myapp-vpc.private_subnets
    vpc_id = module.myapp-vpc.vpc_id

    tags = {
        enivronmet = "development"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 2
            desired_size = 2

            instance_types = ["t4g.small"]
        }
    }
}
