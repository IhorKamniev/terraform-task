#-----networking/outputs.tf-------

output "public_subnets" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

output "private_sg" {
  value = "${aws_security_group.tf_private_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}