# ubuntu 18.04 install KVM

Since my mis-operation, I wrote a wrong boot loader. I installed a ubuntu 18.04
into the server. But I think it is not a big deal. So, I tried to install the KVM.
Here, I will share my experiences and operations.

## Install KVM and its dependent packages

```{shell}
sudo apt update

sudo apt install qemu qemu-kvm libvirt-bin  bridge-utils  virt-manager

```
As long as you successfully installed these packages, your local user will be
added into the `libvirtd` group.

## Start and enable the `libvirtd` service

Although in ubuntu 18.04 will start and enable `libvirtd` automatically after installed
the `qemu` and `libvirtd`. We can start it manually:
```{shell}
sudo service libvirtd start

sudo update-rc.d libvirtd enable

service libvirtd status # confirm the `libvirtd` service's status
```
## Configure the bridging network for the KVM VM

Only by network connecting bridge, the KVM virtual machine can access the external
KVM manager or host. In Ubuntu 18.04, the network is managed by the netplan
utility, which automatically creates a file called`/etc/netplan/50-cloud-init.yaml`
whenever we install a new Ubuntu 18.04 system, which the `netplan` utility will
reference. \\
**ATTENTION** since the configuration file is written by `yaml`, we should make
sure your indentation has no mistake!!
```{yaml}
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager #networkd
  #if your are using the Desktop please stop using NetworkManger
  #since it is not supporting the Bridged mode. Use networkd
  ethernets:
    eno1:
      dhcp4: yes
      dhcp6: no

  bridges:
      br0:
          dhcp4: no
          interfaces:
              - eno1
```
**ATTENTION 2** This configuration is written for the DHCP, since we need to use
VMs outside the server, we shutdown the br0's DHCP. What's more, please check your
Network card's name and interchange the `eno1`
Run the command:`sudo netplan apply` to enable the configuration changes to take
effect.
Also, if your want to try other mode, **check the fourth reference link**.

Run `ifconfig` to check inet information to make sure it is effective.

Run `sudo networkctl status -a` to confirm the network bridge status by using
the following methods.

## Create VM

There are two ways to create a VM:
* `virt-manager`(Graphing Tools)
* `virt-install`(Command Line Tools)
I used the Graphing tools.

Remember that change the Network selection: Specify shared device name and Bridge
name: br0.

## What is `virbr0`

The virbr0, or "Virtual Bridge 0" interface is used for NAT (Network Address
Translation). It is provided by the libvirt library, and virtual environments
sometimes use it to connect to the outside network.

When you create the new VM, the network selection's default option is using `virbr0`
and using it will lose the sense that we created `br0` (`virbr0` is NAT but we
need DHCP)

## Reference
<a href="https://zhuanlan.zhihu.com/p/37635040"> 如何在 Ubuntu 18.04 服务器上安装和配置 KVM </a>
<a href="https://shenxiaohai.me/2018/06/28/gpu-server/"> 搭建公用GPU服务器过程记录 </a>
<a href="http://notes.maxwi.com/2016/11/29/kvm-create-and-manage/"> Ubuntu Server/Debian下的KVM虚拟机创建及管理详解 </a>
<a href="https://blog.ubuntu.com/2017/12/01/ubuntu-bionic-netplan"> Ubuntu Bionic: Netplan </a>
<a href="https://www.iyunv.com/thread-387743-1-1.html"> 理解 virbr0 </a>
<a href="https://askubuntu.com/questions/246343/what-is-the-virbr0-interface-used-for"> What is the virbr0 interface used for>
