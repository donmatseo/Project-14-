# Create Web Instance 1

resource "aws_instance" "project-14-web-instance-1" {
ami = var.ami
instance_type = "t2.micro"

  tags = {
    Name = "project-14-web-instance-1"
  }

subnet_id = aws_subnet.project-14-pub-subnet-1.id
vpc_security_group_ids = [aws_security_group.proj_14_sg.id]
availability_zone = "eu-west-1a"  

associate_public_ip_address = true
   
user_data = <<EOF
                #!/bin/bash 
                # Please make sure to launch Amazon Linux 2 
                yum update -y 
                yum install -y httpd 
                systemctl start httpd 
                systemctl enable httpd

                EOF
}

# Create Web Instance 2

resource "aws_instance" "project-14-web-instance-2" {
ami = var.ami
instance_type = "t2.micro"

 tags = {
    Name = "project-14-web-instance-2"
  }

subnet_id = aws_subnet.project-14-pub-subnet-2.id
vpc_security_group_ids = [aws_security_group.proj_14_sg.id]
availability_zone = "eu-west-1b"  
}
