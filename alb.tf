resource "aws_lb" "alb" {
  name               = "ApplicationLoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.sbn1.id,aws_subnet.sbn2.id]
}

resource "aws_alb_listener" "alb-listener" {
  default_action {
    target_group_arn = aws_lb_target_group.nuvem.arn
    type = "forward"
  }
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
}

resource "aws_lb_target_group" "nuvem" {
  name     = "TGNuvem"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.default.id
  health_check {
    path = "/"
    port = 80
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "nginx" {
  target_group_arn = aws_lb_target_group.nuvem.arn
  target_id        = aws_instance.nginx.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = aws_lb_target_group.nuvem.arn
  target_id        = aws_instance.apache.id
  port             = 80
}