terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0c65adc9a5c1b5d7c"
  instance_type = "t2.nano"
  key_name = "om-import"

  tags = {
    Name = "om-DevOps-batch-server"
    env = "Production"
    owner = "om"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

