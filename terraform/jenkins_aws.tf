provider "aws" {
 region = "us-east-2"
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "jenkins" {
    ami = "${var.instance_ami}"
    instance_type = "t2.xlarge"
    subnet_id ="${aws_subnet.main-public.id}"
    vpc_security_group_ids = [
                                "${aws_security_group.allow-ssh.id}",
                                "${aws_security_group.allow-http.id}"
                            ]
    key_name = "${aws_key_pair.ec2key.key_name}"
    tags = {
        Name = "jenkins"
    }
    associate_public_ip_address = "true"
    connection {
            type = "ssh"
            user = "ubuntu"
            private_key = "${file("~/.ssh/id_rsa")}"
            host = "${self.public_ip}"
        }
    
    provisioner "file" {
    source      = "install_docker.sh"
    destination = "/home/ubuntu/install_docker.sh"
    }
    provisioner "file" {
    source      = "run_jenkins.sh"
    destination = "/home/ubuntu/run_jenkins.sh"
    }
    provisioner "file" {
    source      = "Dockerfile"
    destination = "/home/ubuntu/Dockerfile"
    }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/install_docker.sh",
      "/home/ubuntu/install_docker.sh",
      "chmod +x /home/ubuntu/run_jenkins.sh",
      "/home/ubuntu/run_jenkins.sh",
    ]
  }
}

terraform {
 backend "s3" {
 encrypt = true
 bucket = "ww-develeap"
 region = "us-east-2"
 key = "ww/terraform.tfstate"
 }
}