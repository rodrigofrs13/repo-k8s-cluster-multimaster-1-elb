 worker_processes 4;
worker_rlimit_nofile 40000;

events {
    worker_connections 8192;
}

stream {
    upstream rancher_servers_http {
        least_conn;
        server 10.225.92.47:80 max_fails=3 fail_timeout=5s;
        server 10.225.92.41:80 max_fails=3 fail_timeout=5s;

    }
    server {
        listen 80;
        proxy_pass rancher_servers_http;
    }

    upstream rancher_servers_https {
        least_conn;
        server 10.225.92.47:443 max_fails=3 fail_timeout=5s;
        server 10.225.92.41:443 max_fails=3 fail_timeout=5s;

    }
    server {
        listen     443;
        proxy_pass rancher_servers_https;
    }

}
   

