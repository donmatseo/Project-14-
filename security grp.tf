# Create security group

resource "aws_security_group" "proj_14_sg" {
name = "proj_14_sg"
vpc_id = aws_vpc.project-14-vpc.id

ingress {

from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {

from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]


}
}