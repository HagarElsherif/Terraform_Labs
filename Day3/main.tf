module "mynetwork" {
  source  = "./Network/"
  vpc = var.vpc_cidr
  region  = var.region
  subnets = var.subnets

}