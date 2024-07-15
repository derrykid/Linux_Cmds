[toc]

## Type of network

- LAN: local area network. Limited geographical area e.g. floor, building.
- WAN: Wide area network. large geographical area. e.g. cities, countries.

## Network device

[hub vs switch vs router video](https://www.youtube.com/watch?v=1z0ULvg_pW8) <++>

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


## Network models

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

- Transport layer: Provides reliable data transfer between end systems. It ensures complete data transfer with error recovery and flow control. It has port address: src port address and des port address. **The layer says to application: ok which application has this data?** Protocols that defines segment: TCP, UDP. 

- Network layer: Responsible for data transfer between different networks. It handles logical addressing, routing and packet forwarding. **Creates packet from segment.** It has IP addresses, the source IP address on network, and destination IP address. **IP, ICMP, OSPF is this layer.** 

- Data link layer: Create a frame. Protocols: Ethernet. It also has src and des address. It is MAC address. Protocals are: Ethernet, Wi-Fi (IEEE 802.11).

- Physical layer: send bits and signal transmission by cable, bluetooth, etc.

### TCP/IP model

```
    OSI model          TCP model
-----------------------------------------
7. Application  |                       |
6. Presentation |  Application layer    | create PDU
5. Session      |                       |
-----------------------------------------
4. Transport    |  Transport layer      | (create segment)
-----------------------------------------
3. Network      |  Internet layer       | (create packet)
-----------------------------------------
2. Data link    |                       |
1. Physical     |  Network access layer | (create frame)
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
- Broadcast address at `255`: the last address in the range. It's used to transmit to all host devices.
- Router / gateway address: typically assigned to the first or last usable address in the subnet. It manages the traffic passing between network. such as traffic between private network and public network.

##### Network address

It's the address that **represents the network itself, not any individual device.**

For example, for the IP address `192.168.1.1` with a subnet mask of `255.255.255.0`, the network address is `192.168.1.0`.

#### CIDR Notation

An alternative way to represent subnet masks, e.g., `/24` instead of `255.255.255.0.`

For example, `192.168.1.10/24` indicates that the first 24 bits of the IP address are the network portion. This is equivalent to the subnet mask `255.255.255.0.`

### Config files

- `/etc/hosts` for local DNS
- `/etc/resolv.conf` for DNS config

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
