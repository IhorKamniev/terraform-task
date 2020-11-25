aws_region = "us-east-2"
project_name = "test-tf-task"

vpc_cidr = "10.123.0.0/16"
public_cidrs = [
    "10.123.1.0/24",
    "10.123.2.0/24"
    ]
accessip = "0.0.0.0/0"

key_name = "tf_key" 
public_key_path = "/home/ubuntu/.ssh/id_rsa.pub"
server_instance_type = "t2.micro" 
instance_count = 2