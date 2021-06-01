resource "aws_security_group" "sg-rancher" {
    name = "sg_k8s"
    description = "Security Group Kubernetes"
    vpc_id = "${var.vpcid}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["${var.cidr}"]
        description = "Acesso 80"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["${var.cidr}"]
        description = "Acesso 22 - External"
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["${var.cidrinterno}"]
        description = "Acesso 443"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Security Group Kubernetes"
        Projeto = "${var.tag_projeto}"
        Ambiente = "${var.tag_ambiente}"
        CR = "${var.tag_cr}"
        Onwer = "${var.tag_onwer}"    
    }
}

resource "aws_security_group" "sg-rancher-id" {
    name = "sg_k8s_id"
    description = "All Traffic Security Group Kubernetes"
    vpc_id = "${var.vpcid}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        security_groups = ["${aws_security_group.sg-rancher.id}"]
        description = "SG Acesso 6443"
    }    

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "All Traffic Security Group Kubernetes"
        Projeto = "${var.tag_projeto}"
        Ambiente = "${var.tag_ambiente}"
        CR = "${var.tag_cr}"
        Onwer = "${var.tag_onwer}"   


    }
}