module "test-server" {
    source = "./node-server"

    ami-id = "ami-0800fc0fa715fdcfe"
    key-pair = aws_key_pair.microservices-demo-key.key_name
    name = "Test Server"
}