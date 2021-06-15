#! /bin/bash
sudo apt update
sudo apt-add-repository ppa:ansible/ansible -y
sudo hostnamectl set-hostname k8s-elb-01
sudo apt install htop python git ansible awscli -y
sudo apt-get install -y haproxy -y
echo "   " >> /etc/haproxy/haproxy.cfg
echo "frontend k8s" >> /etc/haproxy/haproxy.cfg
echo "      mode tcp" >> /etc/haproxy/haproxy.cfg
echo "      bind 172.31.90.129:6443" >> /etc/haproxy/haproxy.cfg
echo "      default_backend k8s-masters" >> /etc/haproxy/haproxy.cfg
echo "   " >> /etc/haproxy/haproxy.cfg
echo "backend k8s-masters" >> /etc/haproxy/haproxy.cfg
echo "      mode tcp" >> /etc/haproxy/haproxy.cfg
echo "      balance roundrobin" >> /etc/haproxy/haproxy.cfg
echo "      option tcp-check" >> /etc/haproxy/haproxy.cfg
echo "      server k8s-master-0 172.31.87.97:6443 check fall 3 rise 2" >> /etc/haproxy/haproxy.cfg
echo "      server k8s-master-1 172.31.80.245:6443 check fall 3 rise 2" >> /etc/haproxy/haproxy.cfg
echo "      server k8s-master-2 172.31.85.169:6443 check fall 3 rise 2" >> /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
sudo git clone https://github.com/rodrigofrs13/repo-k8s-cluster-multimaster-1-elb.git /home/ubuntu/rancher-k8s
#sudo echo "`curl http://169.254.169.254/latest/meta-data/local-ipv4`  rancher-elb-01" >> /etc/hosts
#sudo git clone http://algardeploy:aXb7ohyDRzxar_TwtrDA@gitlab.algartech.com/internos/cross/CCOE/template_automation/ansible/rancher.git /home/ubuntu/rancher-elb
#sudo ansible-playbook /home/ubuntu/rancher-elb/ansible/set-ip-hosts.yml
#sudo ansible-playbook /home/ubuntu/rancher-elb/ansible/install_nginx.yml
