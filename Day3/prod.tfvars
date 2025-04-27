region = "eu-central-1"
vpc_cidr = "10.1.0.0/16"
subnets = [
  {
    name       = "prod-public-subnet-1"
    cidr_block = "10.0.101.0/24"
    type       = "public"
  },
  {
    name       = "prod-private-subnet-1"
    cidr_block = "10.0.102.0/24"
    type       = "private"
  },
  {
    name       = "prod-private-subnet-2"
    cidr_block = "10.0.103.0/24"
    type       = "private"
    region     = "eu-central-2"
  }
]
