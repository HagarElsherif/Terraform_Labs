resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public.id  
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  
}


resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private.id  
  route_table_id = aws_route_table.private_route_table.id
}



