nodes:
- address: 10.225.92.44
  user: k8s
  role: [controlplane, etcd]
  ssh_key_path: /home/k8s/.ssh/k8s
- address: 10.225.92.56
  user: k8s
  role: [controlplane, etcd]
  ssh_key_path: /home/k8s/.ssh/k8s
- address: 10.225.92.57
  user: k8s
  role: [controlplane, etcd]
  ssh_key_path: /home/k8s/.ssh/k8s
- address: 10.225.92.47
  user: k8s
  role: [worker]
  ssh_key_path: /home/k8s/.ssh/k8s
- address: 10.225.92.41
  user: k8s
  role: [worker]
  ssh_key_path: /home/k8s/.ssh/k8s


services:
  etcd:
    backup_config:
      interval_hours: 12
      retention: 6
    snapshot: true
    creation: 6h
    retention: 24h

