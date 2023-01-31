//vpc values
vpc-cidr = "10.0.0.0/16"
vpc-name = "my-vpc"

//subnets values
subnet-cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
subnet-names = ["my-public-subnet", "my-private-subnet"]

//internet gateway values
internet-gateway-name = "my-internet-gateway"

//route table
rt-public-cidr = "0.0.0.0/0"
rt-public-name = "rt-for-public-subnet"
rt-private-name = "rt-for-private-subnet"

//nat-gateway values
nat-gateway-name  = "my-nat-gateway"

//ec2
ubuntu-ami = "ami-00874d747dde814fa"
ec2-type = "t2.micro"
ec2-name = ["public-ec2", "private-ec2"]
