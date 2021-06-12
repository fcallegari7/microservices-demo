resource "aws_eip" "api-gateway-eip" {
    instance = module.api-gateway.instance-id
}

module "api-gateway" {
    source = "./node-server"

    ami-id = "ami-0800fc0fa715fdcfe"
    key-pair = aws_key_pair.microservices-demo-key.key_name
    name = "api-gateway"
    subnet-id = aws_subnet.microservices-demo-subnet-public.id
    vpc-security-group-ids = [
        aws_security_group.allow-http.id,
        aws_security_group.allow-ssh.id,
        aws_security_group.allow-all-outbound.id,
    ]
}