# Create Application Load Balancer

resource "aws_lb" "project-14-lb" {
  name               ="project-14-load-balancer"
  internal           = false
  load_balancer_type = "application"

  subnets   = [
    aws_subnet.project-14-pub-subnet-1.id , 
    aws_subnet.project-14-pub-subnet-2.id]
  
security_groups = [aws_security_group.proj_14_sg.id]

  enable_deletion_protection = false

  tags = {
    Name = "project-14-lb"
  }
}
# Create Target Group
# Terraform aws create target group

resource "aws_lb_target_group" "project-14-tg" {
  name     = "project-14-tg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project-14-vpc.id
}

# Create a listener on port 80

   resource "aws_lb_listener" "project_14_listener_group" {
  load_balancer_arn = aws_lb.project-14-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
target_group_arn = aws_lb_target_group.project-14-tg.arn
  }
}