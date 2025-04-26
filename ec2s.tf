resource "aws_instance" "bastion" {
  ami                    = "ami-0b86aaed8ef90e45f" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = "key"
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }

}

resource "aws_instance" "application" {
  ami                    = "ami-0b86aaed8ef90e45f" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = "key"
   tags = {
    Name = "app"
  }
  
}

