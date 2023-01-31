data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}


resource "aws_instance" "public_ec2s" {
  ami = data.aws_ami.ubuntu.id

  for_each = var.public-ec2-info

  instance_type = each.value["ec2_instance_type"]

  key_name = each.value["ec2_key_pair"]

  subnet_id = each.value["ec2_subnet_id"]
  vpc_security_group_ids = [each.value["ec2_sg"]]

  associate_public_ip_address = true
  
  tags = {
    Name = each.value["ec2_name"]
  }

  provisioner "local-exec" {
    command= "echo '${self.arn} :private IP is ${self.private_ip} & public IP is ${self.public_ip}' >> ./all_ips.txt"
  }
  
  provisioner "remote-exec" {

    inline = each.value["public-inline"]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("./lab3-key-pair")
      timeout     = "4m"
    }
    
  }
}

//////////privateeeeeeeeeeeeeeeee

resource "aws_instance" "private_ec2s" {
  ami = data.aws_ami.ubuntu.id

  for_each = var.private-ec2-info

  instance_type = each.value["ec2_instance_type"]
  key_name = each.value["ec2_key_pair"]

  subnet_id = each.value["ec2_subnet_id"]
  vpc_security_group_ids = [each.value["ec2_sg"]]
  
  tags = {
    Name = each.value["ec2_name"]
  }

  provisioner "local-exec" {
  command= "echo '${self.arn}: private IP is ${self.private_ip}' >> ./all_ips.txt"
  }


  provisioner "remote-exec" {
  inline = each.value["private-inline"]
  connection {
        type = "ssh"
        host =  self.private_ip
        user = "ubuntu"
        private_key = file("./lab3-key-pair")
        timeout     = "4m"

        bastion_host = each.value["public_ip_ec2"]
        bastion_user =   "ubuntu"
        bastion_host_key =  file("./lab3-key-pair")
      }
  }
}

