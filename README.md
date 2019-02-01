# Server-and-Openstack

Due to the progress of era, UIC-STAT is now ungrading all the server in these summer holiday and I have the honor to participate in the server setup project.

This repo documents the learning process on server.

## KVM

### What is KVM(Kernel-based Virtual Machine)

KVM is short for Kernel-based Virtual Machine, is a full virtualization solution for Linux on X86 hardware containing virtualization extensions (Intel VT or AMD-V). It consist of a loadable kernel, kvm.ko, that provides the core virtualization infrastructure and a processor specific module, kvm-intel.ko or kvm-amd.ko

Using KVM, one can run multiple virtual machines running unmodified Linux or Windows images. Each virtual machine has private virtualized hardware: a network card, disk, graphics adapter, etc.

KVM is open source software. The kernel component of KVM is included in mainline Linux, as of 2.6.20. The userspace component of KVM is included in mainline QEMU, as of 1.3.

Blogs from people active in KVM-related virtualization development are syndicated at http://planet.virt-tools.org/

This is the structure of KVM

[![400px-Kernel-based_Virtual_Machine.svg.png](https://i.loli.net/2018/09/22/5ba5b478deef7.png)](https://i.loli.net/2018/09/22/5ba5b478deef7.png)

## OpenStack
