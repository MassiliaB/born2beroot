# born2beroot
(42 project) This project aims to introduce you to the world of virtualization. 
You have to creat a virtual machine using VirtualBox (or UTM) and be able to install your own operating system implementing strict rules.

   **Goal :**
   
Set up a minimal non GUI server based on Debian latest stable version.

## Here's some ressources :
**Step 1 : install Debian**

https://www.techrepublic.com/article/how-to-install-a-minimal-server-based-on-debian-10/

**Step 2 : install and configure sudo**

- For configuration, edit `/etc/sudoers` with `sudo visudo`

https://blog.eldernode.com/sudoers-configurations-setting-sudo/

![sudo](https://user-images.githubusercontent.com/62947287/130630092-eb24df5e-14a8-485c-8f7f-72c99bbf3ea5.png)


**Step 3 : adding a user to the sudo and user42 group**

- Creat a new user `adduser <user>`
- Creat a group `addgroup <group>`
- Assign a group to a user `adduser <user> <group>`
- Give admin privilege `usermod -aG sudo <user>`

**Step 4 : configure a password policy**

- For configuration, edit `/etc/pam.d/common-password`
 
https://www.systutorials.com/docs/linux/man/8-pam_pwquality/

![password_policy](https://user-images.githubusercontent.com/62947287/130629302-d4941596-f822-4898-b648-292e858bb150.png)

- For aging control, edit `/etc/login.defs` or `sudo chage -option <user>`
- Display password configuration of a user `chage --list <user`

**Step 5 : install and configure UFW and SSH**

https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-10

**Step 6 : creat a monitoring script**

- See wall command https://phoenixnap.com/kb/linux-wall
- How to run a command stored in a variable shell https://www.baeldung.com/linux/store-command-in-variable

**Step 7 : schedule Crontab to run your script every 10 minutes**

https://crontab.tech/every-minute
