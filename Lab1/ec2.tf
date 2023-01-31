resource "aws_instance" "ubuntu_ec2" {
  ami             = "ami-06878d265978313ca" 
  instance_type   = "t2.micro"
  key_name        = "public-ec2-keypair"
  subnet_id       = "subnet-0ce64dc89d0c60d14"
  security_groups = ["sg-0f2e61e8a37616d4c"]
  associate_public_ip_address = true

  user_data = <<-EOF
#! /bin/bash
sudo apt-get upgrade
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apacahe2
  EOF

  tags = {
    Name = "my-public-ec2"
  }

  volume_tags = {
    Name = "my-public-ec2"
  } 
}