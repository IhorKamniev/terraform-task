#-----compute/main.tf-----------

data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "tf_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

data "template_file" "user-init" {
  count    = 2
  template = "${file("${path.module}/userdata.tpl")}"
}

resource "aws_instance" "tf_public_server" {
  count         = 2
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"

  key_name               = "${aws_key_pair.tf_auth.id}"
  vpc_security_group_ids = ["${var.public_security_group}"]
  subnet_id              = "${element(var.subnets, count.index)}"
  user_data              = "${data.template_file.user-init.*.rendered[count.index]}"
  }
  
resource "aws_instance" "tf_private_server" {
  count         = 2
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"
  
  key_name               = "${aws_key_pair.tf_auth.id}"
  vpc_security_group_ids = ["${var.private_security_group}"]
  subnet_id              = "${element(var.subnets, count.index)}"
  }

  
  