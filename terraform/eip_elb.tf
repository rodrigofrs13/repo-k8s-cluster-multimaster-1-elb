resource "aws_eip" "default" {
  instance = "${aws_instance.rancher-elb-01.id}"
  vpc      = true
}