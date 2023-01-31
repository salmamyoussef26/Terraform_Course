resource "aws_key_pair" "ec2-keypair" {
  key_name   = "public-ec2-keypair"
  public_key = file("~/.ssh/ec2.pub")
}