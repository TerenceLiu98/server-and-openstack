# Server-and-Openstack

Due to the progress of era, UIC-STAT is now ungrading all the server in these summer holiday and I have the honor to participate in the server setup project.

This repo documents the learning process on server.

## KVM

### What is KVM

KVM is short for Kernel-based Virtual Machine, is a full virtualization solution for Linux on X86 hardware containing virtualization extensions (Intel VT or AMD-V). It consist of a loadable kernel, kvm.ko, that provides the core virtualization infrastructure and a processor specific module, kvm-intel.ko or kvm-amd.ko

Using KVM, one can run multiple virtual machines running unmodified Linux or Windows images. Each virtual machine has private virtualized hardware: a network card, disk, graphics adapter, etc.

KVM is open source software. The kernel component of KVM is included in mainline Linux, as of 2.6.20. The userspace component of KVM is included in mainline QEMU, as of 1.3.

Blogs from people active in KVM-related virtualization development are syndicated at http://planet.virt-tools.org/

### How to Use KVM

#### Preparation
**Please check if your device supports the KVM**: ` grep -c 'kmx|svm' /proc/cpuinfo`
if the output is larger than 0, it means you can use KVM on your device.

#### Installation
Before we install the KVM module we need to set up the the **Networking**. There are two types of Networking: Usermode Notworking and Bridged Networking.

##### Usermode Networking
This is the default configuration. In this mode, the virtual-machine can be only accessed by the host-machine and it is not visible to other machines on the network.

##### Bridged Networking
However, using the bridged Networking setting, the virtual-machine is visible for the other machines on the network since bridged networking allows the virtual interfaces to connect to the outside network through the physical interface, making them appear as normal hosts to the rest of the network.

In this section we only set up the second mode: Bridged Networking for we have to connected to virtual-machine via the internal network.

*if your system version is a 'desktop', your device's network is manage by the [NetworkManger] and [NetworkManger] is not supporting the Bridged mode, we have to shut it down first:*
``` shell
chkconfig NetworkManager off
chkconfig network on
service NetworkManager stop
service network start
```
