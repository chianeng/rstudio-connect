//Defining my service provider
provider "aws" {
    region = var.aws_region
    profile = "default"
}

//Provisioning the VPC and its Components
resource "aws_vpc" "rstudio-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.vpc_name}"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}

resource "aws_internet_gateway" "igw" { // Internet Gatway
  vpc_id = aws_vpc.rstudio-vpc.id 

  tags = {
    Name = "${var.vpc_name}"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}
                                    
resource "aws_subnet" "public_subnet" { // Public Subnet
  vpc_id = aws_vpc.rstudio-vpc.id
  cidr_block = var.public_cidr
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true

 tags = {
    Name = "${var.vpc_name}-public-subnet"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}
                              
resource "aws_subnet" "private_subnet" { // Private Subnet
  vpc_id = aws_vpc.rstudio-vpc.id
  cidr_block = var.private_cidr
  availability_zone = var.azs[1] 

 tags = {
    Name = "${var.vpc_name}-private-subnet"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}
                           
resource "aws_route_table" "public_rt" { // Public RouteTable
  vpc_id = aws_vpc.rstudio-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}
                                
resource "aws_route_table" "private_rt" { // Private RouteTable
  vpc_id = aws_vpc.rstudio-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.rstudio_nat.id
  }
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}
                           
resource "aws_route_table_association" "rt_pub_ass" {  //Public Routetable Association
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
                          
resource "aws_route_table_association" "rt_pri_ass" { //Public Routetable Association
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
                            
resource "aws_eip" "nat_eip" { // Elastic IP
  domain   = "vpc"
}
                         
resource "aws_nat_gateway" "rstudio_nat" { // Nat Gateway
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "${var.vpc_name}-natgw"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_instance" "app_server1" {  // Provisioning the EC2 Instance
  ami           = var.app_server1_ami
  instance_type = var.app_server1_instance_type

  availability_zone = var.azs[0]
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.rstudio_sg.id]
  key_name = aws_key_pair.terra-key.key_name 
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  user_data = "${file("install-rstudio.sh")}"
  tags = {
    Name = "${var.vpc_name}-${var.app_server1_instance_name}"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}

resource "aws_key_pair" "terra-key" { // Keypair 
  key_name   = "terra-key"
  public_key = tls_private_key.rsa_private_key.public_key_openssh
}

// Security group for the app-server
resource "aws_security_group" "rstudio_sg" {
  name        = "${var.vpc_name}-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.rstudio-vpc.id

 dynamic "ingress" {
   for_each = local.inbound_rules
   content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-sg"
    Env= local.common_tags["Env"]
    Team= local.common_tags["Team"]
  }
}
