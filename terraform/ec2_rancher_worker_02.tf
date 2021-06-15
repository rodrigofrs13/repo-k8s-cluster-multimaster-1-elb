data "aws_ami" "ubuntuw02" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]

  }

  owners = ["099720109477"] #Ubuntu

}

resource "aws_instance" "rancher-worker-02" {
//ami = "${var.ami}" // Ubuntu 18
ami           = data.aws_ami.ubuntuw02.id
instance_type = "${var.type_instance_rancher_worker}"
key_name = "${var.keyname}"  
vpc_security_group_ids = ["${aws_security_group.sg-rancher.id}","${aws_security_group.sg-rancher-id.id}"]
subnet_id = "${var.subnetid}"
private_ip = "172.31.92.81"
user_data = "${file("rancher-worker-02.sh")}"
iam_instance_profile = "${aws_iam_instance_profile.role-instance-profile.name}"
tags = {
    Name = "k8s-worker-02"
    Projeto = "${var.tag_projeto}"
    Funcao = "K8s Worker"
    Ambiente = "${var.tag_ambiente}"
    CR = "${var.tag_cr}"
    Onwer = "${var.tag_onwer}"
}
}