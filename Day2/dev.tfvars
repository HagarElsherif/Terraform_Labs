region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
subnets = [
  {
    name       = "public-subnet-1"
    cidr_block = "10.0.1.0/24"
    type       = "public"
  },
  {
    name       = "private-subnet-1"
    cidr_block = "10.0.2.0/24"
    type       = "private"
  },
   {
    name       = "private-subnet-2"
    cidr_block = "10.0.3.0/24"
    type       = "private"
  }
]
