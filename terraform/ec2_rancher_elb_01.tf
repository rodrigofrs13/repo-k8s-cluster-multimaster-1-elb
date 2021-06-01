resource "aws_instance" "rancher-elb-01" {
ami = "${var.ami}" // Ubuntu 18
instance_type = "${var.type_instance_elb}"
key_name = "${var.keyname}"  
vpc_security_group_ids = ["${aws_security_group.sg-rancher.id}","${aws_security_group.sg-rancher-id.id}"]
private_ip = "172.31.90.129"
subnet_id = "${var.subnetid}"
user_data = "${file("rancher-elb-01.sh")}"
iam_instance_profile = "${aws_iam_instance_profile.role-instance-profile.name}"
tags = {
    Name = "k8s-elb-01"
    Projeto = "${var.tag_projeto}"
    Funcao = "ELB"
    Ambiente = "${var.tag_ambiente}"
    CR = "${var.tag_cr}"
    Onwer = "${var.tag_onwer}"
}
}