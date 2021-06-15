#! /bin/bash
sudo apt update
sudo apt-add-repository ppa:ansible/ansible -y
sudo hostnamectl set-hostname k8s-master-03
sudo apt install wget curl htop python git ansible awscli -y
sudo echo "172.31.90.129 k8s-elb-01" >> /etc/hosts
sudo echo "`curl http://169.254.169.254/latest/meta-data/local-ipv4`  k8s-master-01" >> /etc/hosts
sudo git clone https://github.com/rodrigofrs13/k8s-cluster-simples.git
sudo echo "br_netfilter" > /etc/modules-load.d/k8s.conf
sudo echo "ip_vs" >> /etc/modules-load.d/k8s.conf
sudo echo "ip_vs_rr" >> /etc/modules-load.d/k8s.conf
sudo echo "ip_vs_sh" >> /etc/modules-load.d/k8s.conf
sudo echo "ip_vs_wrr" >> /etc/modules-load.d/k8s.conf
sudo echo "nf_conntrack_ipv4" >> /etc/modules-load.d/k8s.conf
sudo curl -fsSL https://get.docker.com | bash
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo apt-get update && apt-get install -y apt-transport-https gnupg2
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo kubeadm config images pull
#sudo git clone https://github.com/rodrigofrs13/repo-k8s-cluster-multimaster-1-elb.git /home/ubuntu/rancher-k8s
#sudo echo "`curl http://169.254.169.254/latest/meta-data/local-ipv4`  rancher-master-01" >> /etc/hosts
#sudo git clone http://algardeploy:aXb7ohyDRzxar_TwtrDA@gitlab.algartech.com/internos/cross/CCOE/template_automation/ansible/rancher.git /home/ubuntu/rancher-k8s
#sudo ansible-playbook /home/ubuntu/rancher-k8s/ansible/set-ip-hosts.yml
#sudo ansible-playbook /home/ubuntu/rancher-k8s/ansible/k8s_All_install_docker.yml
#sudo ansible-playbook /home/ubuntu/rancher-k8s/ansible/k8s_Master_install_k8s.yml
#sudo ansible-playbook /home/ubuntu/rancher-k8s/ansible/k8s_master_install_RKE.yml
#sudo ansible-playbook /home/ubuntu/rancher-k8s/ansible/k8s_Worker_install_Rancher.yml



