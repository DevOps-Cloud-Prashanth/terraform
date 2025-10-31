#vpc creation

resource "aws_vpc" "name" {        
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "custom-vpc"
  }
}

#subnets

resource "aws_subnet" "name1" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  tags ={
   Name = "subnet1-public"
  }
}



resource "aws_subnet" "name2" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  tags ={
   Name = "subnet1-private"
  }
}

 
#created ig and attached to vpc

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  
}

#route table creation   #subnet association with route table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.name.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  
}

#aws route table association
resource "aws_route_table_association" "name" {
 route_table_id = aws_route_table.public_rt.id
 subnet_id = aws_subnet.name1.id
}





#craetion of sg

resource "aws_security_group" "name" {
  vpc_id = aws_vpc.name.id
  name = "saicharan"
  description = " allow"


    ingress  {
    description = "allow ssh"
    from_port =22
    to_port =22
    protocol ="tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "all0w tcp"
    from_port = 443
    to_port = 443
    protocol ="tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
egress  {
     description = "allow all out bound"
     from_port =0
     to_port =0
     protocol ="-1"
     cidr_blocks = ["0.0.0.0/0"]
 }
  
  
}
 resource "aws_eip" "nat_eip" {
  domain = "vpc"
 }
resource "aws_nat_gateway" "name" {
 subnet_id = aws_subnet.name1.id
  allocation_id = aws_eip.nat_eip.id
  depends_on    = [aws_internet_gateway.name]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.name.id
   
}
resource "aws_route_table_association" "name2" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.name2.id
  
}
resource "aws_instance" "name1" {
  ami = "ami-01760eea5c574eb86"
  count = 2
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name1.id
  vpc_security_group_ids = [ aws_security_group.name.id ]
  tags = {
    Name = "public-server"
  }
  
}
resource "aws_instance" "name2" {
  ami = "ami-01760eea5c574eb86"
  count = 2
  instance_type = "t3.micro"
  subnet_id = aws_subnet.name2.id
  vpc_security_group_ids = [ aws_security_group.name.id ]
  tags = {
    Name = "private-server"
  }
  
}

  






