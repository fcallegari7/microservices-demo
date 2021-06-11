resource "aws_db_subnet_group" "private" {
    name = "microservices-demo-db-subnet-group-private"
    subnet_ids = [aws_subnet.microservices-demo-subnet-private-1.id, aws_subnet.microservices-demo-subnet-private-2.id]

    tags = {
        Name = "Private DB Subnet Group"
    }
}

resource "aws_internet_gateway" "microservices-demo" {
    vpc_id = aws_vpc.microservices-demo.id
}

resource "aws_subnet" "microservices-demo-subnet-public" {
    availability_zone_id = "uswe2-az1"
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.microservices-demo.id

    tags = {
        Name = "Microservices Demo Subnet (Public)"
    }
}

resource "aws_subnet" "microservices-demo-subnet-private-1" {
    availability_zone_id = "uswe2-az1"
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.microservices-demo.id

    tags = {
        Name = "Microservices Demo Subnet (Private 1)"
    }
}

resource "aws_subnet" "microservices-demo-subnet-private-2" {
    availability_zone_id = "uswe2-az2"
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.microservices-demo.id

    tags = {
        Name = "Microservices Demo Subnet (Private 2)"
    }
}

resource "aws_vpc" "microservices-demo" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "Microservices Demo VPC"
    }
}