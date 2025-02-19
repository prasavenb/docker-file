resource "aws_instance" "docker" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "Docker"
  }
}


resource "null_resource" "docker" {
  
   triggers = {
    instance_id = aws_instance.docker.id
  }
  
   connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.docker.public_ip
  }
   provisioner "file" {
    source      = "install.sh"
    destination = "/tmp/install.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo sh /tmp/install.sh"
    ]
  }  
}