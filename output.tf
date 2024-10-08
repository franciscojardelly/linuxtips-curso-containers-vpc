### VPC ###
output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}

### SUBNETS PRIVADAS ###
output "ssm_subnet_private_1a" {
  value = aws_ssm_parameter.private_1a.id
}

output "ssm_subnet_private_1b" {
  value = aws_ssm_parameter.private_1b.id
}

output "ssm_subnet_private_1c" {
  value = aws_ssm_parameter.private_1c.id
}

### SUBNETS PUBLICAS ###
output "ssm_subnet_public_1a" {
  value = aws_ssm_parameter.public_1a.id
}

output "ssm_subnet_public_1b" {
  value = aws_ssm_parameter.public_1b.id
}

output "ssm_subnet_public_1c" {
  value = aws_ssm_parameter.public_1c.id
}

### SUBNETS DATABASE ###
output "ssm_subnet_database_1a" {
  value = aws_ssm_parameter.database_1a.id
}

output "ssm_subnet_database_1b" {
  value = aws_ssm_parameter.database_1b.id
}

output "ssm_subnet_database_1c" {
  value = aws_ssm_parameter.database_1c.id
}