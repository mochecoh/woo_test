#VPC
resource "aws_vpc" "main" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "main"
    }
}

#Public Subnets
resource "aws_subnet" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    map_public_ip_on_launch = "true"
    cidr_block = "10.0.1.0/28"
    tags = {
        Name = "Nginx Public IP"
    }
}

#Internet Getway
resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

#Route tables
resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

#Route public 
resource "aws_route_table_association" "main-public" {
  subnet_id      = "${aws_subnet.main-public.id}"
  route_table_id = "${aws_route_table.r.id}"
}