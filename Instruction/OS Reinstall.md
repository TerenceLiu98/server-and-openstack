# OS Reinstall

For some how, I can access the original Windows Server 2012 R2(I do not have the
password).

## Delete Original Virtual Disk

In this server ( Dell R740 ), there are four disk, two of them are SSD (240 GitB)
and others are SAS (600 GitB). I would like to set up a Virtual RAID 1.

* Reboot your Server
  I don't care what method you are using, first, please reboot your server.

* Entering the Server's Configuration Utility
  1. Press down `F2`, then, you can enter the **System Setup** interface.
  2. Click **Device Settings**, where lists all the options of system Configuration.
  3. Focus on the **Virtual Disk Management**, where is allows you to configure,
  manage, and view the virtual disk properties.

* Deleting the virtual disk 
  1. Click Virtual Disk Management > Select Virtual Disk Operations.
  2. Select a virtual disk that you want to delete from the drop-down menu.
  3. Click the link Delete Virtual Disks. To continue, confirm the option that you selected.
  4. Select Confirm and click Yes to continue. The selected virtual disk is deleted.

* Creating virtual disks

  To implement **RAID** functions, you must create a virtual disk. A virtual disk refers to storage created by a RAID controller from one or more physical disks. Although a virtual disk may be created from several physical disks, it is seen by the operating system as a single disk.

  Before creating a virtual disk, you should be familiar with the information in Considerations Before Creating Virtual Disks.

  You can create a Virtual Disk using the Physical Disks attached to the PERC controller. To create a Virtual Disk, you must have the Server Control user privilege. You can create a maximum of 64 virtual drives and a maximum of 16 virtual drives in the same drive group.

  You cannot create a virtual disk if:
  1. Physical disk drives are not available for virtual disk creation. Install additional physical disk drives.
  2. Maximum number of virtual disks that can be created on the controller has been reached. You must delete at least one virtual disk and then create a new virtual disk.
  3. Maximum number of virtual disks supported by a drive group has been reached. You must delete one virtual disk from the selected group and then create a new virtual disk.
  4. A job is currently running or scheduled on the selected controller. You must wait for this job to complete or you can delete the job before attempting a new operation. You can view and manage the status of the scheduled job in the Job Queue page.
  5. Physical disk is in non-RAID mode. You must convert to RAID mode using iDRAC interfaces such as iDRAC web interface, RACADM, Redfish, WSMan, or <CTRL+R>.

To protect our data, I chose the **RAID 1**

## References

<a href="https://www.dell.com/support/manuals/ca/en/cabsdt1/poweredge-r740/idrac_3.15.15.15_ug/creating-virtual-disks?guid=guid-129334bc-ed79-440b-bf1b-b97f48042028&lang=en-us"> Dell Support </a>
