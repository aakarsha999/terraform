# Create a Route Table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "web-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "app-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "app-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }
}


# Route Table Association
resource "aws_route_table_association" "rt-as-1" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "rt-as-2" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "rt-as-3" {
  subnet_id      = aws_subnet.pvt-sub-1.id
  route_table_id = aws_route_table.app-rt.id
}
resource "aws_route_table_association" "rt-as-4" {
  subnet_id      = aws_subnet.pvt-sub-2.id
  route_table_id = aws_route_table.app-rt.id
}

resource "aws_route_table_association" "rt-as-5" {
  subnet_id      = aws_subnet.pvt-sub-3.id
  route_table_id = aws_route_table.app-rt.id
}
resource "aws_route_table_association" "rt-as-6" {
  subnet_id      = aws_subnet.pvt-sub-4.id
  route_table_id = aws_route_table.app-rt.id
}

