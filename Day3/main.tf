module "mynetwork" {
  source  = "./Network/"
  vpc_cidr = var.vpc_cidr
  region  = var.region
  subnets = var.subnets

}