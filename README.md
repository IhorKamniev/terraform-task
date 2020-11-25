# terraform-task

#NOTE: task is done using Cloud9

    This terraform configuration creates:
    - S3 bucket;
    - VPC;
    - Internet gateway;
    - 2 route tables(public and private);
    - NAT gateway (not active);
    - 4 subnets (2 public and 2 private);
    - 2 security groups (public and private);
    - 4 instances (2 in public subnet and 2 in private subnet);
    
        Steps:
        
        In terraform.tfvars specify appropriate path to public_key_path 
        
        In root directory perform:
        1. terraform init   # to initialize a working directory containing Terraform configuration files
        2. terraform plan   # to view execution plan
        3. terraform apply  # to apply Terraform configurations
        4. terraform destroy # to destroy created configurations
