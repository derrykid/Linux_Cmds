[toc]

## Type of network

- LAN: local area network. Limited geographical area e.g. floor, building.
- WAN: Wide area network. large geographical area. e.g. cities, countries.

## Network device

[hub vs switch vs router video](https://www.youtube.com/watch?v=1z0ULvg_pW8)

![router switch and hub](https://media.router-switch.com/media/wysiwyg/Help-Center-FAQ/Router/hub-in-networking.jpg) 

**Hub and switch doesn't readd IP address.** So when connects to public network and read IP address, you need router.

### Hub

- Operates at Physical layer (Layer 1)

When data packet arrives in the hub. **the hub broadcasts it to every device on the network.** 

It keeps a table but it only knows which port is currently in use. It 


### switch

![network switch](https://juniper-prod.scene7.com/is/image/junipernetworks/4100-mg-48p-front-top-switches-banner?fmt=png8-alpha&wid=1280&dpr=off)

- operates at Data link layer (Layer 2)
- use MAC address to forward frames

It's a hardware device that connects multiple devices in the **same network.** It directs data traffic from a source to a destination by *switching data* from src to des.

Switch keeps a table of device with it's MAC address. So it knows where the data goes.

Computing devices connect to a switch by network interface card and cable.

### router

![router](https://images.squarespace-cdn.com/content/v1/540f5515e4b06c4e8629c108/1631109466820-BTX48APN7K1HTD911BKK/Cisco+Small+Business+RV+Series+Routers.jpg) 

- operates at network layer (Layer 3)
- read IP address

It connects multiple switches. It enables connection between different network.

Router acts as a dispatcher. It decides which way to send packet of data. It's located at any gateway where one network meets another.

## Connections

### TCP three way handshake

![three way handshake](https://www.johnpfernandes.com/wp-content/uploads/2018/12/120818_0035_TheTCP3Wayh1.png) 

1. SYN (Synchronize):

- The client sends a TCP packet with the SYN (synchronize) flag set to the server to initiate a connection.
- This packet includes an initial sequence number (ISN) chosen by the client.

2. SYN-ACK (Synchronize-Acknowledge):

- The server responds with a TCP packet that has both the SYN and ACK (acknowledge) flags set.
- The SYN flag is set to indicate the server’s readiness to synchronize.
- The ACK flag acknowledges the client’s SYN packet by setting the acknowledgment number to the client’s ISN + 1.

3. ACK (Acknowledge):

- The client sends a final TCP packet with the ACK flag set.

By the end of the three-way handshake, the TCP connection is established.

### TCP vs UDP

|                     | TCP                   | UDP                      |
|---------------------|-----------------------|--------------------------|
| **Connection Type** | Connection-oriented   | Connectionless           |
| **Usage**           | Reliable data delivery| Unreliable data delivery |
| **Common Protocols**| HTTP, FTP, SMTP       | DNS, DHCP, SNMP          |
| **Speed**           | Slower due to overhead| Faster, minimal overhead |
| **Reliability**     | Reliable              | No guarantee of delivery, no sequencing |


## Network models

- A *hop* is the step from one network segment to the next. 

### OSI model

```
7. Application      --+
6. Presentation       |  Aims to produce Protocol data unit (PDU)
5. Session          --+
4. Transport        ->   Produce segment from PDU
3. Network
2. Data link
1. Physical
```

Going down the stack calls **encapslation**. Going up the stack calls **decapslation.** 

- Application layer: Mostly for end-users, e.g. web browser, email clients. Popular protocols are HTTP(S), FTP, POP, SMTP, DNS

- Presentation layer: Encode/decode, encrypt/decrypt data transimission

- Session layer: Manages sessions between applications, maintaining and terminating connections.

- Transport layer: Create datagrams and segments. Provides reliable data transfer between end systems. It ensures complete data transfer with error recovery and flow control. It has port address: src port address and des port address. **The layer says to application: ok which application has this data?** Protocols that defines segment: TCP, UDP.

- Network layer: Responsible for data transfer between different networks. It handles logical addressing, routing and packet forwarding. **Creates packet from segment.** It has IP addresses, the source IP address on network, and destination IP address. **IP, ICMP, OSPF is this layer.** 

- Data link layer: Create a frame. Protocols: Ethernet. It also has src and des address. It is MAC address. Protocals are: Ethernet, Wi-Fi (IEEE 802.11).

- Physical layer: send bits and signal transmission by cable, bluetooth, etc.

### TCP/IP model

```
    OSI model          TCP model
-----------------------------------------
7. Application  |                       |
6. Presentation |  Application layer    | create PDU
5. Session      |                       | (known as software layer)
-----------------------------------------
4. Transport    |  Transport layer      | (create segment)
-----------------------------------------
3. Network      |  Internet layer       | (create packet)
-----------------------------------------
2. Data link    |                       | (create frame)
1. Physical     |  Network access layer | 
-----------------------------------------
```

## Network interface

By default, most Linux servers has 2 network interfaces, which are sometimes referred to as network interface card (NIC) or network adapter:

- loopback interface: A interface that loop back to own system internally. Primarily used for administrative tasks, development, and troubleshooting.

- Ethernet interface: **Physical** or **virtual** network adapter that Linux server uses to connect to. Network IP addresses are typically assigned to this interface. Usually listed as `eth0, en0`

```
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noque..
    ...
2: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu ..
    ...
187: enp0s13f0u2u1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu ..
    ...
```

## Network address

- IPv4: 32-bit
- IPv6: 128-bit

### IPv4

An IP address consists of 2 components:

```
Network    Host
|-----|   |-----|
v     v   v     v
xxx.xxx . xxx.xxx
```

- Network portion: Identifies the specific network. This length can vary. It can be the first 8, 16, 24 bits. If `192.168.1.1` with subnet mask of `255.255.255.0`, the first three octets `192.168.1` represent the network portion
- Host portion: Identifies the specific device (or host) within that network. Continuing with the example above, the last octet (1) represents the host portion.

Th  combination of the *network portion and the host portion* uniquely identifies a device within a network.

#### Subnet mask

- A 32-bit number that divides the IP address into the network and host portions. 

- Represented in decimal format (e.g., 255.255.255.0).  

- Uses contiguous bits set to 1 to indicate the network portion and contiguous bits set to 0 to indicate the host portion.

For example:
```
IP Address: 192.168.1.1
Subnet Mask: 255.255.255.0
Network Address: 192.168.1.0 (Network portion: 192.168.1, Host portion: 0)
```

#### Special addresses

The special address is reserved for purposes. E.g. loopback netowrk, router address, and broadcast address.

- Network address at `0`: represent entire network
- Router / gateway address at `1`: typically assigned to the first or last usable address in the subnet. It manages the traffic passing between network. such as traffic between private network and public network.
- Broadcast address at `255`: the last address in the range. It's used to transmit to all host devices.

##### Network address

It's the address that **represents the network itself, not any individual device.**

For example, for the IP address `192.168.1.1` with a subnet mask of `255.255.255.0`, the network address is `192.168.1.0`.

#### CIDR Notation

An alternative way to represent subnet masks, e.g., `/24` instead of `255.255.255.0.`

For example, `192.168.1.10/24` indicates that the first 24 bits of the IP address are the network portion. This is equivalent to the subnet mask `255.255.255.0.`

### Config files

- `/etc/hosts` for local DNS
- `/etc/resolv.conf` for DNS config

### IPv4 classes and ranges

There are 5 classes of 32-bit IP addresses. The value of first octet determines the class:

- class A: leading 0, range `1.0.0.0 to 127.255.255.255`
    - private address `10.0.0.0 to 10.255.255.255`
- class B: leading 10, range `128.0.0.0 to 191.255.0.0`
    - private address `172.16.0.0 to 172.31.255.255`
- class C: leading 110, range `192.0.0.0 to 223.255.255.255`
    - private address `192.168.0.0 to 192.168.255.255`
- class D: leading 1110, range `224.0.0.0 to 239.255.255.255`
- class E: leading 1111 , range `240.0.0.0 to 254.255.255.255`, reserved for experimental purposes

- loopback, in range of class A, `127.0.0.1 to 127.255.255.254`

Leading 0 means in binary format: `0xxxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx`

### IPv6 addresses

- IPv6 uses hexadecimal
- 8 sets of (four hex digits)
- consists of two (64-bit parts)

```
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

You can compress the IPv6. 2 rules apply:

1. Leading zero compression: `0800 -> 800`, `0000 -> 0`
2. Zero compression: **Only use one time** for consecutive zeros, replaced with `::`. e.g. `2001:DB8:800:2:0:0:0:C -> 2001:DB8:800:2::C`

### Netmask / subnet mask

It is a type of netmask used to *partition a larger network into smaller subnets.* 

It works similarly by indicating:
- network portion
- host portion

Example of 16 bits subnet mask
```
network   host
|     | |     |
xxx.xxx.xxx.xxx
```

You can set the network portion with 8, 16, 24 bits. 

With subnet mask of `255.0.0.0`, the leftmost 8 bits `255` is the network ID, it's fixed. 

#### CIDR notation

Classless Inter-Domain Routing (CIDR) notation is an alternative way to specify a subnet mask, using a suffix that indicates the number of network bits.

Example: `192.168.1.10/24`

The `/24` indicates that the first 24 bits are the network portion, equivalent to the subnet mask `255.255.255.0.`

It's also common to indicate numbers like `/21, /22` or any other number. It's more convenient way to note the subnet mask than traditional way.

| CIDR Notation | Subnet Mask         | Number of IP Addresses |
|---------------|---------------------|------------------------|
| /16           | 255.255.0.0         | 65,536                 |
| /17           | 255.255.128.0       | 32,768                 |
| /18           | 255.255.192.0       | 16,384                 |
| /19           | 255.255.224.0       | 8,192                  |
| /20           | 255.255.240.0       | 4,096                  |
| /21           | 255.255.248.0       | 2,048                  |
| /22           | 255.255.252.0       | 1,024                  |
| /23           | 255.255.254.0       | 512                    |
| /24           | 255.255.255.0       | 256                    |
| /25           | 255.255.255.128     | 128                    |
| /26           | 255.255.255.192     | 64                     |
| /27           | 255.255.255.224     | 32                     |
| /28           | 255.255.255.240     | 16                     |


### Ports

| Port Range       | Description              | Port Numbers         |
|------------------|--------------------------|----------------------|
| System Ports     | Well-known ports         | 0 - 1023             |
| User Ports       | Registered ports         | 1024 - 49151         |
| Dynamic Ports    | Private/ephemeral ports  | 49152 - 65535        |

#### Common system ports

| Protocol | Port Number | Application/Service    |
|----------|-------------|------------------------|
| TCP/UDP  | 20          | FTP (Data Transfer)    |
| TCP/UDP  | 21          | FTP (Control)          |
| TCP      | 22          | SSH                    |
| TCP      | 23          | Telnet                 |
| TCP/UDP  | 25          | SMTP                   |
| TCP/UDP  | 53          | DNS                    |
| TCP      | 80          | HTTP                   |
| TCP      | 110         | POP3                   |
| TCP      | 143         | IMAP                   |
| TCP      | 443         | HTTPS                  |
| TCP      | 465         | SMTPS                  |
| TCP      | 587         | SMTP (Submission)      |
| TCP      | 993         | IMAPS                  |
| TCP      | 995         | POP3S                  |
| TCP/UDP  | 161         | SNMP                   |
| TCP/UDP  | 389         | LDAP                   |
| TCP/UDP  | 514         | Syslog                 |
| TCP      | 587         | SMTP (Mail Submission) |
| UDP      | 636         | LDAPS                  |

#### Common user ports

| Protocol | Port Number | Application/Service             |
|----------|-------------|---------------------------------|
| TCP/UDP  | 1433        | Microsoft SQL Server            |
| TCP      | 3306        | MySQL                           |
| TCP      | 3389        | Remote Desktop Protocol         |
| TCP      | 5432        | PostgreSQL                      |
| TCP      | 5900        | VNC (Virtual Network Computing) |
| TCP/UDP  | 8080        | HTTP Alternate                  |
| TCP      | 8443        | HTTPS Alternate                 |
| TCP      | 11211       | Memcached                       |
| TCP      | 27017       | MongoDB                         |
| TCP      | 6379        | Redis                           |
| TCP      | 24800       | OpenVPN                         |
| UDP      | 1194        | OpenVPN                         |
| TCP/UDP  | 8081        | HTTP Proxy                      |
| TCP      | 9418        | Git                             |
| TCP      | 27015       | Steam (Valve game servers)      |
| TCP/UDP  | 25565       | Minecraft                       |


### TCP Sockets

The combination of IP address and a port number **is called a socket.** 

Example: `192.168.10.1:80`

A socket can be used for multiple connections, e.g. a web server can serve manay connections.


## Tools

- `nmap` 
- `nc`

### Create network connection and test the port with `nc`

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

### Ping operates on Network layer (layer 3)

It uses the Internet Control Message Protocol (ICMP), which is a part of the Network Layer. 

ICMP is used for sending error messages and operational information, such as when a service is unavailable or when a router cannot be reached.

### `netstat`

Use to check onnectivity at multiple layers of the OSI model depending on which of the options are used with the command.

### `tcpdump`

Captures and analyzes network packets. Useful for deep network traffic analysis and troubleshooting complex network issues.

### `ip route show` for route tables

```bash
1: default via 172.24.0.1 dev wlp0s20f3 proto dhcp src 172.24.66.3 metric 600 
2: 172.24.0.0/17 dev wlp0s20f3 proto kernel scope link src 172.24.66.3 metric 600 
```
For entry 1:
- `default via 172.24.0.1`: the default gateway/router IP. It's where the packets are sent to for outside LAN. It can be internet or other subnet.
- `dev wlp0s20f3`: the network interface for this route.
- `proto dhcp`: Indicates this route was config via DHCP
- `src 172.24.66.3`: source IP address assigned to the interface, which in my machine.
- `metric 600`: used for algo to find best route

---
For entry 2:
- `172.24.0.0/17`: indicates the size of the subnet
- `proto kernal`: indicates this route was config by kernal
- `src 172.24.66.3`: source IP address for this route

---
Based on output, the default gateway IP address is `172.24.0.1`. This means that any packets that are destined for IP addresses outside of your local subnet `172.24.0.0/17` will be sent to this gateway.

**Note:** See there's no switch here because switch works on MAC address, it's layer 2. IP address is layer 3.
