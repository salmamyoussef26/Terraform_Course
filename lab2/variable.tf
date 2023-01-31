//vpc vars
variable "vpc-cidr"{
    description = "cidr block value"
    type = string
}

variable "vpc-name"{
    type = string
}

//subnet vars
variable "subnet-cidrs"{
        
}

variable "subnet-names" {
    
}

//internt gateway vars
variable "internet-gateway-name"{
    type = string
}

//route table
variable "rt-public-cidr"{
    type = string
}

variable "rt-public-name"{
    type = string
}
variable "rt-private-name" {
    type = string
}
//nat gateway vars
variable "nat-gateway-name"{
    type = string
}

//ec2
variable "ubuntu-ami"{
    type = string
}
variable "ec2-type" {
  type = string
}
variable "ec2-name"{
    
}
