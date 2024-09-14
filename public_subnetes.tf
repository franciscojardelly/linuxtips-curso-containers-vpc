## Criando subnet publica 1 AZ-a
resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.48.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-public-subnet-1a", var.project_name)
  }
}

## Criando subnet publica 1 AZ-b
resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.49.0/24"
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-public-subnet-1b", var.project_name)
  }
}

## Criando subnet publica 1 AZ-c
resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.50.0/24"
  availability_zone = format("%sc", var.region)

  tags = {
    Name = format("%s-public-subnet-1c", var.project_name)
  }
}

## Criando tabela de rotas de saída pra internet
resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-public", var.project_name)
  }
}

## Criando a rota default para as subnetes publicas 
## Qualquer destino diferente da rede local vai ser enviada para o internet gateway
resource "aws_route" "public_access" {
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

## Associando a tabela de rota "publica" de saída para internet na subnet publica 1 AZ-a
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_internet_access.id
}

## Associando a tabela de rota "publica" de saída para internet na subnet publica 1 AZ-b
resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_internet_access.id
}

## Associando a tabela de rota "publica" de saída para internet na subnet publica 1 AZ-c
resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_internet_access.id
}