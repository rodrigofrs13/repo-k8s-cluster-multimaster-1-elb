resource "aws_instance" "rancher-master-01" {
ami = "${var.ami}" // Ubuntu 18
instance_type = "${var.type_instance_rancher_master}"
key_name = "${var.keyname}"  
vpc_security_group_ids = ["${aws_security_group.sg-rancher.id}","${aws_security_group.sg-rancher-id.id}"]
subnet_id = "${var.subnetid}"
private_ip = "172.31.87.97"
user_data = "${file("rancher-master-01.sh")}"
iam_instance_profile = "${aws_iam_instance_profile.role-instance-profile.name}"
tags = {
    Name = "k8s-master-01"
    Projeto = "${var.tag_projeto}"
    Funcao = "K8s Master"
    Ambiente = "${var.tag_ambiente}"
    CR = "${var.tag_cr}"
    Onwer = "${var.tag_onwer}"
}
}