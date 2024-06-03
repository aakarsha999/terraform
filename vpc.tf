
# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc"
  }
}

# Public Subnets 
resource "aws_subnet" "pub-sub-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-sub-1"
  }
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.16/28"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "pub-sub-2"
  }
}


# Private Subnets
resource "aws_subnet" "pvt-sub-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.32/28"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "pvt-sub-1"
  }
}
resource "aws_subnet" "pvt-sub-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.48/28"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "pvt-sub-2"
  }
}

resource "aws_subnet" "pvt-sub-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.64/28"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "pvt-sub-3"
  }
}
resource "aws_subnet" "pvt-sub-4" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.80/28"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "pvt-sub-4"
  }
}





