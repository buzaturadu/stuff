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
- 20 GB storage

VM can be created using a downloaded img or Ubuntu can be installed from scratch 

Using img:

	sudo virt-install --name pfsense --ram 8048 --disk path=./iso/bionic-server-cloudimg-amd64.img --vcpus 4 --os-type linux --os-variant generic --network bridge=virbr0 --network bridge=virbr1 --network bridge=virbr2 --graphics vnc --console pty,target_type=serial --boot hd

Using iso:

	sudo virt-install --name pfsense --ram 8048 --disk path=./vmdisks/pfsense.qcow2,size=20 --vcpus 4 --os-type linux --os-variant generic --network bridge=virbr0 --network bridge=virbr1 --network bridge=virbr2 --graphics vnc --console pty,target_type=serial --cdrom '/home/buz/iso/ubuntu-20.04-server-amd64.iso


# Installing pfSense

First go to [pfsense](https://www.pfsense.org/download/) website and download the image from there.


![enter image description here](https://static.packt-cdn.com/products/9781789532975/graphics/3846fd1a-e6f5-4537-aa8f-18a1821401f9.png)
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
.
.

## SmartyPants

SmartyPants converts ASCII punctuation characters into "smart" typographic punctuation HTML entities. For example:

|                |ASCII                          |HTML                         |
|----------------|-------------------------------|-----------------------------|
|Single backticks|`'Isn't this fun?'`            |'Isn't this fun?'            |
|Quotes          |`"Isn't this fun?"`            |"Isn't this fun?"            |
|Dashes          |`-- is en-dash, --- is em-dash`|-- is en-dash, --- is em-dash|


## KaTeX

You can render LaTeX mathematical expressions using [KaTeX](https://khan.github.io/KaTeX/):

The *Gamma function* satisfying $\Gamma(n) = (n-1)!\quad\forall n\in\mathbb N$ is via the Euler integral

$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
$$

> You can find more information about **LaTeX** mathematical expressions [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

