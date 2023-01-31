resource "aws_instance" "public-ec2" {
  ami           = var.ubuntu-ami
  instance_type = var.ec2-type
  subnet_id = aws_subnet.my-subnets[0].id
  security_groups = [aws_security_group.sec-group.id]
  associate_public_ip_address = true

  tags = {
    "Name" = var.ec2-name[0]
  }
}

resource "aws_instance" "private-ec2" {
  ami           = var.ubuntu-ami
  instance_type = var.ec2-type
  subnet_id = aws_subnet.my-subnets[1].id
  security_groups = [aws_security_group.sec-group.id]
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo echo "Hello from terraform" > /var/www/html/index.html
sudo systemctl enable nginx
sudo systemctl start nginx
  EOF
  tags = {
    "Name" = var.ec2-name[1]
  }
}

