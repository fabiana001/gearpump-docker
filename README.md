#gearpump-docker
Single node Gearpump Cluster in Docker container. T

This should only be used for demo purpose, as the configuration here is not optimal. 
 
## Usage
Start Gearpump Cluster, run this command. The command will first pull Gearpump docker image from remote docker registry. This can take a little while. 
```
# Gearpump Dashboard is served at 
#  http://127.0.0.1:8090
docker run -t -p 8090:8090 --name gearpump gearpump/gearpump
```
Note that the command will run Gearpump in foreground. If you want to start Gearpump in background, add `-d` after `docker run`.

To kill the cluster, you can run `docker stop gearpump` or press `CTRL+C`.

## Using Docker behind Firewall
If your working environment is behind a firewall. You need specify proxy for `docker`, otherwise `docker` is not able to pull any images from remote.
For example, for CentOS 7
```
mkdir /etc/systemd/system/docker.service.d
echo [Service] > /etc/systemd/system/docker.service.d/http-proxy.conf
echo Environment="HTTP_PROXY=http://your_proxy_host:your_proxy_port" >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo Environment="HTTPS_PROXY=http://your_proxy_host:your_proxy_port" >> /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl restart docker
```

## OS Requirements.
Docker requires Linux kernel >= 3.10, for example, CentOS7.
