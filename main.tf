provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "example" {
  name        = "hemaunique12345"
  description = "Example security group for EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "nginx_instance" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  security_groups = ["hemaunique12345"]

  tags = {
    Name = "nginx-instance"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' playbook.yml"
  }
}


