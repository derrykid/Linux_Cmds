
## Ports

### To scan available ports 

```bash
nmap <IP address>
nmap 8.8.8.8
```


### Create network connection and test the port 

```bash
nc <hostname | ip address> <port>
nc -zv example.com 80
```

After the connection starts, we can send data over the socket

```bash
nc -zv www.google.com 80
```
This creates a connection on port 80 with Google


### Port scanning `nmap`

```bash
nmap [Scan Type(s)] [Options] <host>
nmap google.com
```
Output:
```
Starting Nmap 7.95 ( https://nmap.org ) at 2024-06-30 11:04 IST
Nmap scan report for www.google.com (209.85.202.104)
Host is up (0.014s latency).
Other addresses for www.google.com (not scanned): 2a00:1450:400b:c03::6a 2a00:1450:400b:c03::69 2a00:1450:400b:c03::63 2a00:1450:400b:c03::67 209.85.202.147 209.85.202.103 209.85.202.99 209.85.202.105 209.85.202.106
rDNS record for 209.85.202.104: dg-in-f104.1e100.net
Not shown: 998 filtered tcp ports (no-response)
PORT    STATE SERVICE
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 4.91 seconds
```

Other usages:
```bash
# with port range
namp -p 1-100 host.com  

# aggressive scan: OS, version detection, ports, traceroute
nmap -A hostname
```
