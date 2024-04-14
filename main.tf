provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "nginx_instance" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  tags = {
    Name = "nginx-instance"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' playbook.yml"
  }
}

