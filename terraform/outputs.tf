output "nginx" {
  value = "${aws_instance.jenkins.public_ip}"
}

output "app" {
  value = "${aws_instance.app.public_ip}"
}
