provider "aws" {
    region = "${var.aws_region}"
}

#Deploy Storage resources
module "storage" {
    source = "./storage"
    project_name = "${var.project_name}"
}

# Deploy Networking Resources

module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  private_cidrs = "${var.private_cidrs}"
}

# Deploy Compute Resources

module "compute" {
  source          = "./compute"
  instance_count  = "${var.instance_count}"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type   = "${var.server_instance_type}"
  subnets         = "${module.networking.public_subnets}"
  public_security_group  = "${module.networking.public_sg}"
  private_security_group  = "${module.networking.private_sg}"
  subnet_ips      = "${module.networking.subnet_ips}"
}