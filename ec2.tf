resource "aws_instance" "nginx" {
  ami           = var.ami_amazon
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instances.id]
  subnet_id = aws_subnet.sbn1.id
  user_data = <<-EOF
    #!/bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo systemctl start nginx
    
    echo "<h3>DevOps Challenge</h3><br><h1>NINGX</h1>" | sudo tee /usr/share/nginx/html/index.html
  EOF
}

resource "aws_instance" "apache" {
  ami           = var.ami_amazon
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instances.id]
  subnet_id = aws_subnet.sbn2.id
  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y httpd
    sudo systemctl start httpd
    echo "<h3>DevOps Challenge</h3><br><h1>APACHE</h1>" | sudo tee /var/www/html/index.html
  EOF
}