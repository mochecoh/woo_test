resource "aws_instance" "app" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    subnet_id ="${aws_subnet.main-public.id}"
    vpc_security_group_ids = [
                                "${aws_security_group.allow-ssh.id}",
                                "${aws_security_group.allow-http.id}"
                            ]
    key_name = "${aws_key_pair.ec2key.key_name}"
    tags = {
        Name = "app"
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
    source      = "run_app.sh"
    destination = "/home/ubuntu/run_app.sh"
    }
    provisioner "file" {
    source      = "./dockerfiles/Dockerfile_app"
    destination = "/home/ubuntu/Dockerfile"
    }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/install_docker.sh",
      "chmod +x /home/ubuntu/run_app.sh",
      "/home/ubuntu/install_docker.sh",
      "/home/ubuntu/run_app.sh",
    ]
  }
}