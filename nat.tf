resource "aws_eip" "eip_nat" {
  

  tags = {
    Name = "eip1"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.pub-sub-2.id

  tags = {
    "Name" = "Nat Gateway"
  }
}