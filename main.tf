# Main VPC

resource "aws_vpc" "project-14-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "project-14-vpc"
  }
}

# Public Subnet 1

resource "aws_subnet" "project-14-pub-subnet-1" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = "eu-west-1a"

  tags = {
    Name = "project-14-pub-subnet-1"
  }
}

# Public Subnet 2

resource "aws_subnet" "project-14-pub-subnet-2" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.public_subnet_2_cidr_block
  availability_zone = "eu-west-1b"

  tags = {
    Name = "project-14-pub-subnet-2"
  }
}

# Public Subnet 3

resource "aws_subnet" "project-14-pub-subnet-3" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.public_subnet_3_cidr_block
  availability_zone = "eu-west-1c"

  tags = {
    Name = "project-14-pub-subnet-3"
  }
}

# Private Subnet 1

resource "aws_subnet" "project-14-pri-subnet-1" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.private_subnet_1_cidr_block
  availability_zone = "eu-west-1a"

  tags = {
    Name = "project-14-pri-subnet-1"
  }
}

# Private Subnet 2

resource "aws_subnet" "project-14-pri-subnet-2" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.private_subnet_2_cidr_block
  availability_zone = "eu-west-1b"

  tags = {
    Name = "project-14-pri-subnet-2"
  }
}

# Private Subnet 3

resource "aws_subnet" "project-14-pri-subnet-3" {
  vpc_id     = aws_vpc.project-14-vpc.id
  cidr_block = var.private_subnet_3_cidr_block
  availability_zone = "eu-west-1c"

  tags = {
    Name = "project-14-pri-subnet-3"
  }
}

# Public Route Table

resource "aws_route_table" "project-14-public-route-table" {
  vpc_id = aws_vpc.project-14-vpc.id

  tags = {
    Name = "project-14-public-route-table"
  }
}

# Private Route Table

resource "aws_route_table" "project-14-private-route-table" {
  vpc_id = aws_vpc.project-14-vpc.id

  tags = {
    Name = "project-14-private-route-table"
  }
}

# Association of Public Subnet 1 with Public Route Table

resource "aws_route_table_association" "project-14-pub-subnet-1-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pub-subnet-1.id
  route_table_id = aws_route_table.project-14-public-route-table.id
}

# Association of Public Subnet 2 with Public Route Table

resource "aws_route_table_association" "project-14-pub-subnet-2-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pub-subnet-2.id
  route_table_id = aws_route_table.project-14-public-route-table.id
}

# Association of Public Subnet 3 with Public Route Table

resource "aws_route_table_association" "project-14-pub-subnet-3-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pub-subnet-3.id
  route_table_id = aws_route_table.project-14-public-route-table.id
}

# Association of Private Subnet 1 with Private Route Table

resource "aws_route_table_association" "project-14-pri-subnet-1-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pri-subnet-1.id
  route_table_id = aws_route_table.project-14-private-route-table.id
}

# Association of Private Subnet 2 with Private Route Table

resource "aws_route_table_association" "project-14-pri-subnet-2-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pri-subnet-2.id
  route_table_id = aws_route_table.project-14-private-route-table.id
}

# Association of Private Subnet 3 with Private Route Table

resource "aws_route_table_association" "project-14-pri-subnet-3-association-with-rt" {
  subnet_id      = aws_subnet.project-14-pri-subnet-3.id
  route_table_id = aws_route_table.project-14-private-route-table.id
}

# Internet Gateway

resource "aws_internet_gateway" "project-14-igw" {
  vpc_id = aws_vpc.project-14-vpc.id

  tags = {
    Name = "project-14-igw"
  }
}

# Internet Gateway Association with Public Route Table

resource "aws_route" "igw-assoc-with-pub-rt" {
  route_table_id            = aws_route_table.project-14-public-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.project-14-igw.id
}