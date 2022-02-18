# Create a MySQl RDS Instance

resource "aws_db_instance" "db_p14" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "db_p14"
  username             = "dmo"
  password             = "passdmoos"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  availability_zone = "eu-west-1a"

 }

# Create Database Subnet Group

resource "aws_db_subnet_group" "project-14-db-sub-grp" {
  name       = "project-14-db-sub-grp"
  subnet_ids = [aws_subnet.project-14-pri-subnet-1.id, aws_subnet.project-14-pri-subnet-2.id, aws_subnet.project-14-pri-subnet-2.id]

  tags = {
    Name = "project-14-db-sub-grp"
  }
}


# Create Database Security Group

resource "aws_security_group" "proj-14-db-sec-grp" {
  name        = "proj-14-db-sec-grp"
  description = "Allow http inbound traffic "
  vpc_id      = aws_vpc.project-14-vpc.id

  
ingress {
    description      = "HTTP from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  tags = {
    Name = "proj-14-db-sec-grp"


  }
}