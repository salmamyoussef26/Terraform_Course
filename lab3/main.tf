# module "vpc"{
#     source = "./vpc"

#     vpc-cidr = "10.0.0.0/16"
# }

# module "internet-gateway"{
#     source = "./internet_gateway"
#     vpc-id = module.vpc.vpc-id-output
#     internet-gateway-name = "my-internt-gateway"
# }

# module "security_group"{
#     source = "./security_group"
#     vpc-id = module.vpc.vpc-id-output
# }

# module "subnet" {
#     source = "./subnet"

#     vpc-id = module.vpc.vpc-id-output

#     subnet-info = {

#     "pb_subnet_az_a" = {
#         az = "us-east-1a"
#         cidr = "10.0.0.0/24"
#         name = "public_subnet_az_a"
#     }

#     "pb_subnet_az_b" = {
#         az = "us-east-1b"
#         cidr = "10.0.2.0/24"
#         name= "public_subnet_az_b"
#     }

#     "pr_subnet_az_a" = {
#         az = "us-east-1a"
#         cidr = "10.0.1.0/24"
#         name= "private_subnet_az_a"
#     }

#     "pr_subnet_az_b" = {
#         az = "us-east-1b"
#         cidr = "10.0.3.0/24"
#         name = "private_subnet_az_b" 
#     }
#  }
# }

# module "ec2" {
#     source = "./ec2"

#     public-ec2-info = {

#     "pb_ec2_az_a" = {
#         ec2_name = "public_ec2_az_a"
#         ec2_key_pair = "lab3-key-pair"
#         ec2_instance_type = "t2.micro"
#         ec2_subnet_id = module.subnet.subnet_ids["pb_subnet_az_a"]
#         ec2_sg = module.ec2.public-ip-ec2["pb_subnet_az_a"]

#       public-inline = [
#       "echo 'hello world'",
#       "sudo apt update -y",
#       "sudo apt install -y nginx",
#       //"sudo echo 'server { \n listen 80 default_server; \n  listen [::]:80 default_server; \n  server_name _; \n  location / { \n  proxy_pass http://${module.alb-all.private_LB_DNS}; \n  } \n}' > default",
#       //"sudo mv default /etc/nginx/sites-enabled/default",
#       "sudo systemctl restart nginx",
#   ]

#     }

#     "pb_ec2_az_b" = {
#         ec2_name = "public_ec2_az_b"
#         ec2_key_pair = "lab3-key-pair"
#         ec2_instance_type = "t2.micro"
#         ec2_subnet_id = module.subnet.subnet_ids["pb_subnet_az_b"]
#         ec2_sg = module.security_group.sg-public-ec2-id

#       public-inline = [
#       "echo 'hello world'",
#       "sudo apt update -y",
#       "sudo apt install -y nginx",
#       //"sudo echo 'server { \n listen 80 default_server; \n  listen [::]:80 default_server; \n  server_name _; \n  location / { \n  proxy_pass http://${module.alb-all.private_LB_DNS}; \n  } \n}' > default",
#       //"sudo mv default /etc/nginx/sites-enabled/default",
#       "sudo systemctl restart nginx",
#     ]
#     }
#   }
  
#     private-ec2-info = {

#     "pr_ec2_az_a" = {
#         ec2_name = "private_ec2_az_a"
#         ec2_key_pair = "lab3-key-pair"
#         ec2_instance_type = "t2.micro"
#         ec2_subnet_id = module.subnet.subnet_ids["pr_subnet_az_a"]
#         ec2_sg = module.security_group.sg-private-ec2-id
#         public_ip_ec2 = module.ec2.public-ip-ec2["pb_subnet_az_a"]
#         private-inline=[
#       "sudo apt update -y",
#       "sudo apt install nginx -y",
#       //"private_ip=`sudo curl http://169.254.169.254/latest/meta-data/local-ipv4`",
#       "sudo echo 'Hello from private instance ' > index.html",
#       //"sudo echo $private_ip >> index.html",
#       "sudo mv index.html  /var/www/html/",
#   ]
#     }

#     "pr_ec2_az_b" = {
#         ec2_name = "private_ec2_az_b"
#         ec2_key_pair = "lab3-key-pair"
#         ec2_instance_type = "t2.micro"
#         ec2_subnet_id = module.subnet.subnet_ids["pr_subnet_az_b"]
#         ec2_sg = module.security_group.sg-private-ec2-id
#         public_ip_ec2 = module.ec2.public-ip-ec2["pb_subnet_az_b"]

#       private-inline=[
#       "sudo apt update -y",
#       "sudo apt install nginx -y",
#     #   "private_ip=`sudo curl http://169.254.169.254/latest/meta-data/local-ipv4`",
#        "sudo echo 'Hello from private instance ' > index.html",
#     #   "sudo echo $private_ip >> index.html",
#       "sudo mv index.html  /var/www/html/",
#     ]
#     }
#   }

# }

# module "target_group"{
#     source = "./target_group"

#     tg-info = {
#         "public-tg" ={
#             name = "public-tg"
#             port = 80
#             protocol = "HTTP"
#             vpc-id = module.vpc.vpc-id-output
#         }
#         //private
#     }
    
#     tg-attachment = {
#         "public-ec2-a-attachment" = {
#           tg-arn = module.target_group.tg-arn["public-tg"]
#           ec2-id = module.ec2.public-ec2-ids["pb_ec2_az_a"]
#           port = 80
#         }
#         "public-ec2-b-attachment" = {
#           tg-arn = module.target_group.tg-arn["public-tg"]
#           ec2-id = module.ec2.public-ec2-ids["pb_ec2_az_b"]
#           port = 80
#         }
#         //private ec2 attachment
#     }

#     # public-LB-listener = {
#     #     "public-listener" = {
#     #     loadbalancer_arn  = module.load_balancer.public-LB-arn["public-LB"]
#     #     port = "80"
#     #     protocol = "HTTP"
#     #     type = "forward"
#     #     tg-arn = module.target_group.tg-arn["public-tg"]
#     #     }
#     # }

#     public-listener-info = {
#         "public-lisneter"={
#             LB_arn = module.load_balancer.public-LB-arn["public-LB"]
#             port = "80"
#             protocol = "HTTP"
#             type = "forward"
#             tg-arn = module.target_group.tg-arn["public-tg"]
#         }
        
#     }

# }


# module "route-table"{
#     source = "./route_table"

#     rt-info = {

#         "rt-public-subnets-info"= {
#         vpc_id =  module.vpc.vpc-id-output
#         cidr = "0.0.0.0/0"
#         gateway_id = module.internet-gateway.gateway_id
#         tag = "route-table-public-subnets"
#         }

#         "rt-private-subnets-info" = {
#         vpc_id =  module.vpc.vpc-id-output
#         cidr = "0.0.0.0/0"
#         gateway_id = module.nat-gateway.nat-gateway-id
#         tag = "route-table-private-subnets"
#         }
#     }

#     rt-association = {
#         "pb_subnet_a_association" = {
#             subnet_id = module.subnet.subnet_ids["pb_subnet_az_a"]
#             rt_id = module.route-table.rt-id["rt-public-subnets-info"]
#         }
#         "pb_subnet_b_association" = {
#             subnet_id = module.subnet.subnet_ids["pb_subnet_az_b"]
#             rt_id = module.route-table.rt-id["rt-public-subnets-info"]
#         }
#         // "pr_subnet_a_association"

#     }
# }

# module "load_balancer"{
#     source = "./load_balancer"
    
#     public-LB-info = {

#         "public-LB" = {
#         name = "public-LB"
#         internal = "false"
#         LB-type = "application"
#         sg-LB = module.security_group.sg-public-LB
#         subnet-id = [module.subnet.subnet_ids["pb_subnet_az_a"], module.subnet.subnet_ids["pb_subnet_az_b"]]
#         }
#     }
    
#     # private-LB-info = {

#     # }
# }

# module "nat-gateway"{
#     source = "./nat_gateway"
#     subnet-id = module.subnet.subnet_ids["pb_subnet_az_a"]
#     net-id = module.internet-gateway.gateway_id
#     nat-name = "my-nat-01"
# }