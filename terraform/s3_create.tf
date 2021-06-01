resource "aws_s3_bucket" "k8s-s3-rancher" {
  bucket = "${var.awsbucket}"
  acl = "private"

//  versioning {
//    enabled = true
//  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "${var.awsbucket}"
    Projeto = "${var.tag_projeto}"
    Ambiente = "${var.tag_ambiente}"
    CR = "${var.tag_cr}"
    Onwer = "${var.tag_onwer}"     
  }
}

