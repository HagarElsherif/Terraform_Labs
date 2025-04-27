output "subnets" {
    value = aws_subnet.subnets
  
}
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "bastion_sg" {
  value = aws_security_group.bastion_sg
}
output "app_sg" {
  value = aws_security_group.app_sg
}