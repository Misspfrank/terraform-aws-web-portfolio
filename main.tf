module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  azs             = var.azs
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.vpc.security_group_id
  userdata          = var.userdata_files
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.vpc.security_group_id
  instance_ids      = module.ec2.instance_ids
  alb_security_group_id = module.vpc.security_group_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "misspjanuary2026bucket" 
}
