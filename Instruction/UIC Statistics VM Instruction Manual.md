# UIC Statistics VM Instruction Manual

<center> Terecne Lau </center>

This is the instruction manual for those who are using, will use the STAT-Server's. Please read it carefully. If there is any concern, question and comment, contact the administrator. 

## FOR ALL THE USERS

Since the ITSC forbid allocating the DHCP, the server net bridge is now using the school's DHCP, that is to say, the IP of your computer is alterable randomly. If you want to keep your IP you can set the **Static IP** by yourselves. *( I have not tried this operation. )*

If your VM is not performing well enough to support your work, please give the application to the server administrator.

## FOR THE WINDOWS USERS

The administrator has gave you the initial **teamviewer** ID and password, using this application, you can remote control the VM whenever and wherever you want, as long as your have downloads the bundled software：<a href="https://teamviewer.com"> Teamviewer Home Page </a>

Also, if you found your VM is not windows-activated or it can not connect to the internet, please check the system time. Just reset the **auto proofread**. If this is not working, please contact to the administrator.

**How to reset the password ?** The initial password is a weak password, that means the password shell be decrypted easily. Please change your password as soon as you get the VM.
What's more, the default security questions' answers are your ID. If the answers are wrong, please contact to the administrator.


## FOR THE LINUX USERS

For linux, you have multiple ways to connect to you VM, remotely.

**SSH** is standard configuration on every Linux computer. In the Intranet, you can assess the VM by SSH.
SSH is short for **Secure Shell, Socket Socket Shell**, a kind of network protocol. It gives computer users a secure way to access remote computers, a form of public key encryption. Here is the five types of Encryption:
* RSA
* RSA1
* DSA
* DCDSA
* ED25519
  The default encryption is `RSA`. Here are the steps for the **SSH** freshmen:
1. Install **openssh**

```{shell}
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install openssh-server
```

1. Keys generation
   use `ssh-keygen -t rsa` command to generate your private key and pulic key
   The private key will store in `~/.ssh/id_rsa` and the pulic key will store in `~/.ssh/id_rsa.pub`;
2. Transfer the Public Key to the Server
   You can copy the public key to the remote server by issuing this command:
   `ssh-copy-id remote_host`
   or you just use `cat` command to copy the key mannually: `cat ~/.ssh/id_rsa.pub

For more information please google it or check the reference links below. Those macOS users, your computers have internal SSH client server, just open the terminal. For windows users, you have to download some application if you want to use the SSH, likes *PUTTY* etc..

For the Extranet, you can use the **Teamviewer**,or you can also use **Reverse Proxy** to access to your VM, likes `ssh`,`nginx`,etc., here I will not give the unnecessary details.

## Reference
* <a href="https://support.microsoft.com/en-us/help/4028457/windows-10-reset-your-local-account-password"> Reset your Windows 10 local account password </a>
* <a href="https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server-in-ubuntu"> How To Use SSH to Connect to a Remote Server </a>
* <a href="https://www.makeuseof.com/tag/remotely-manage-linux-server-ssh/"> Configuring Your Server SSH Settings </a>