data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = module.mynetwork.subnets["public-subnet-1"].id
  vpc_security_group_ids = [module.mynetwork.app_sg.id]
  key_name               = "key"
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }
  provisioner "local-exec" {
    command = "echo Bastion Public IP: ${self.public_ip}"
  }

}

resource "aws_instance" "application" {
  ami                    = data.aws_ami.amazon_linux.id 
  instance_type          = "t2.micro"
  subnet_id              = module.mynetwork.subnets["private-subnet-1"].id
  vpc_security_group_ids = [module.mynetwork.bastion_sg.id]
  key_name               = "key"
   tags = {
    Name = "app"
  }
  
}

