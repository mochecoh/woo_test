output "nginx" {
  value = "${aws_instance.jenkins.public_ip}"
}
