output "alb_address" {
  value = [aws_lb.alb.dns_name]
}