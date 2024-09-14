### Criando o internet gateway para associar as subnetes publicas e atraves delas expor nossos serviços para internete.
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-igw", var.project_name)
  }
}