# Install and config pfSense for one-node infrastructure 

## One-node infrastructure

Having a single, beefy server can be a problem sometimes. We needed a fleet of virtual servers for various applications and tests, and a router for all of them, but because this is a home setup, we only had a single physical machine for that. The only viable solution was to have a one-node infrastructure.

## The solution

We came up with a solution that uses various technologies from the virtualization world. A few
key points must be met:
- Server
- Two or more physical NICs
- Capable hypervisor
 
## The server

Our machine is a Dell PowerEdge R420 with the following relevant specifications:

- 2x Intel Xeon E5-2420 1.9 Ghz, 8 cores
- 8x 16GB ECC RAM
- 2x 500GB SSD
- 2x Gigabit NICs


## The hypervisor

There are various hypervisors capable of doing what we needed, like Proxmox, ovirt, KVM, Hyper-V, ESXi etc. We opted for KVM on Ubuntu because it's stable and it's free.

## Networking

Our ISP requires PPPoE authentication, and at each reconnect, our public IP changes. We needed a router for the VMs and for the office, but we first need to take care of the network virtualization part. We created networks, called VM Network, Management Network, and WAN. Might be a bit confusing, but each network has a purpose:
- VM Network - this is the equivalent of LAN. All VMs will be connected to this network.
- Management Network - all management interfaces will be connected to this network, like IDRAC, ILO, Access Points, Switch etc
- WAN - our ISP

## VM specs for pfSense

In order to have good performance with the virtual router the VM should have enough resources. We chose next specs

- 4 CPUs
- 8 GB RAM
- 10 GB storage

Ceate the VM with the next command

	sudo virt-install --name pfsense --ram 8048 --disk path=./vmdisks/pfsense.qcow2,size=10 --vcpus 4 --os-type linux --os-variant generic --network bridge=virbr0 --network bridge=virbr1 --network bridge=virbr2 --graphics vnc --console pty,target_type=serial --cdrom '/pfSense-CE-2.4.5-RELEASE-amd64.iso'


# Installing pfSense

First go to [pfsense](https://www.pfsense.org/download/) website and download the image from there and unzip ip

	unzip pfSense-CE-2.4.5-RELEASE-amd64.iso.gz

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/1.png?raw=true)

Boot the VM using pfSense installation iso

On welcome screen hit Enter

![2](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/2.png?raw=true)

Accept the End User License Agreement.

![3](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/3.png?raw=true)

Select install

![4](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/4.png?raw=true)

Select keyboard layout

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/5.png?raw=true)

Select the Auto(UFS) option

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/6.png?raw=true)

Select the No

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/7.png?raw=true)

Press Enter to reboot the VM

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/8.png?raw=true)


After rebooting, will ask if you need to configure VLANs. We do not have VLANs so hit n

Next the system will try to detect the list of available network interfaces.
The system will ask you to choose 1 interface as the external interface [WAN] and 1 for [LAN].  In our example we have em0 fo WAN and em1 for LAN

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/9.png?raw=true)

Instalation complete

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/10.png?raw=true)

## pfSense Dashboard Login

Log in using the following URL https://10.10.1.1 and default credentials
 - Username: admin  
 - Password: pfsense
![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/11.png?raw=true)


## pfSense Setup Wizard

On step 1 and 2 just simply click Next. On third step set a Hostname and a domain if you have one and the Primary and Secondary DNS Server 8.8.4.4 or 8.8.8.8 and 1.1.1.1

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/12.png?raw=true)

Step 4 perform the Timezone and NTP server configuration.

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/13.png?raw=true)

Step 5 select the configuration of the WAN interface. PPPoE in our case.

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/14.png?raw=true)

Step 6 configure the LAN interface

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/15.png?raw=true)


Step 7 set up the admin password

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/16.png?raw=true)


On step 8 check and on 9 reload the pfSense configuration and you are done

![enter image description here](https://github.com/buzaturadu/stuff/blob/master/pfsense_install/images/17.png?raw=true)










.
.
.
.
.
.
.
.
.
.
.


|                |ASCII                          |HTML                         |
|----------------|-------------------------------|-----------------------------|
|Single backticks|`'Isn't this fun?'`            |'Isn't this fun?'            |
|Quotes          |`"Isn't this fun?"`            |"Isn't this fun?"            |
|Dashes          |`-- is en-dash, --- is em-dash`|-- is en-dash, --- is em-dash|

