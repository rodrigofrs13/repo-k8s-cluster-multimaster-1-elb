variable "vpcid" {
    description = "Enter the VPC ID"
    default = "vpc-9d5bd9e0"
}

variable "awsbucket" {
  description = "Enter the S3 bucket"
  default = "xxxxxxs3-k8s-rancher-dev" 
}

variable "subnetid" {
    description = "Enter the SubnetID"
    default = "subnet-2f730f0e"
}

variable "cidr" {
  description = "cidr blocks algar tech"
  default = "0.0.0.0/0"
}

variable "cidrinterno" {
  description = "cidr blocks algar tech - internal"
  default = "0.0.0.0/0"
}

variable "keyname" {
  description = "Define key connect ssh"
  default = "rodrigofrsppk"
}

variable "ami" {
  description = "The name for the AMI - AWS"
  default = "ami-09e67e426f25ce0d7"       // Ubuntu 18.04
//  default = "ami-0fc61db8544a617ed"         // Amazon Linux
}

variable "type_instance_elb" {
  description = "Define type from instance"
  //default = "t3a.micro"
  default = "t2.micro"
}

variable "type_instance_rancher_master" {
  description = "Define type from instance"
  default = "t3a.medium"
  //default = "t2.micro"
}

variable "type_instance_rancher_worker" {
  description = "Define type from instance"
  default = "t3a.medium"
  //default = "t2.micro"
}

variable "tag_projeto" {
  description = "Define type from instance"
  default = "Plataforma Rancher"
}

variable "tag_ambiente" {
  description = "Define type from instance"
  default = "PROD"
//default = "DEV"  
}

variable "tag_cr" {
  description = "Define type from instance"
  default = "XXXXXXXXXXXXXX"
}

variable "tag_onwer" {
  description = "Define type from instance"
  default = "AlgarTech - CCoE"
}
 


