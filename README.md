# Intel OpenVINO Examples
This README contains the setup notes required to get some of the
examples up and running inside the Intel OpenVINO toolkit.  Initially
there is a particular focus on getting the **"interactive face detection
sample"** working, in the context of the Valtech VOID project. 

## Broad context as to why this workflow has to be set up

The Intel OpenVINO Toolkit works on specific operating systems,
therefore requires some kind of separate contained environment to
install everything.

This README takes you through installing OpenVINO on Ubuntu, where
this is a guest virtual environment inside VirtualBox installed on a
MacBook.

## Work in progress notice

We will iterate/clarify the instruction set, so feedback welcome.

## VirtualBox

- Install VirtualBox.
- Additionally install the VirtualBox Extension Pack.
- Both of the above can be done from
  [here](https://www.virtualbox.org/wiki/Downloads).

## Get the correct Ubuntu .iso image

One of the compatible operating systems for the Intel OpenVINO toolkit
is **Ubuntu 16.03.3 LTS (64 bit)**.  This is the guest operating system we
will install on VirtualBox.

Obtain the file ```ubuntu-16.04.3-desktop-amd64.iso``` which is an ISO
Disk Image that is 1.59 GB in size.  The file can be downloaded from
[here](http://old-releases.ubuntu.com/releases/16.04.3/) or obtained
from someone who has already downloaded it.

Put this file in an obvious location on your laptop - you will point
to this file from within VirtualBox.  For example, you can put it in
the folder ```/Users/{your_username}/ubuntu/``` after you have
downloaded or copied it from elsewhere.

## Obtain the OpenVINO Toolkit

You can get the OpenVINO toolkit by either finding someone who has
already downloaded the .tar file, otherwise you can download it yourself.

The OpenVINO toolkit is
[here](https://software.intel.com/en-us/openvino-toolkit).  The
"Choose and Download" button on the upper right-hand-side gets you to
[this page](https://software.intel.com/en-us/openvino-toolkit/choose-download)
where you have a windows/linux option to obtain the toolkit.
Following the linux option, it requires you to "Register & Download".

Once you have downloded it onto your system, copy the .tar file onto a
USB 3.0 stick.  This is so that the file can be easily accessable from
the guest (ubuntu) system.  (File sharing between the host and guest
systems can be done, but is a bit more involved).  Also ensure it is
USB 3.0 to take advantage of fast copy speeds.

We already have a .tar file on a USB stick (the name of the file is
```l_openvino_toolkit_p_2018.3.343.tar```).  This will be used after
preparing the Ubuntu environment, which is the next step.

## Prepare the Ubuntu Environment

This section is dedicated to just preparing the Ubuntu environment
prior to the installation of the OpenVINO Toolkit.

### Creation of new VirtualBox Disk Image

- Start VirtualBOX.
- Select "New" in the top Left-hand corner of the VirtualBox manager.
- In the section "Name and operating system" give the forthcoming
  virtual environment a name of your choice, set "Type" to "Linux" and
  set "Version" to "Ubuntu (64-bit)".
- In the section "Memory Size" set the memory size to 10,000 MB.  This
  assumes that the available memory on the laptop/system is larger
  than that.
- In the section "Hard disk", check the dial "Create a virtual hard
disk now".
- Proceed by checking the "Create" button.
- You will now be prompted to set more parameters...
- Set the "File size" to be 25 GB.
- Set the "Hard disk file type" to VDI (VirtualBox Disk Image).
- Set "Storage on physical hard disk" to "Fixed Size".
- Proceed by checking the "Create" button.  The creation of the .vdi
file file will take a minute or so.

### Configuring USB ports

The guest operating system you have created above needs to know what
USB items are going to be used in conjunction with it, and this
includes the Intel Movidius Stick (a.k.a. Neural Compute Stick), any
webcams etc.

- Select, with 1-click, the virtual machine that you have just
created.
- Settings | Ports | USB
- Ensure "Enable USB controller" is ticked, and check radial dial
  "USB 3.0 (xHCI) Controller".  The easiest way of setting the correct
  USB device filters is to actually stick the USB device into the
  laptop and use the symbol with the green plus sign to select the
  actual device that you are adding in.  Doing this auto-fills the
  items in the USB device filters list, including information on
  Product ID, Vendor ID etc.

### Set up user credentials for the machine you have created

- Start the machine that you have created by clicking once on the
machine name in the VirtualBox manager and then clicking once on the
green right-arrow.
- Point to and select the Ubuntu .iso file on your host system and hit
  the "Start" button.
- Select "Install Ubuntu".
- Check the box "Download updates while installing Ubuntu", and click
the "Continue" button.
- Check the radial dial "Erase disk and install Ubuntu", and click the
  "Install Now" button.  (This is only relevant for the guest
  environment, not your host computer.)  Click "Continue" if you get
  the pop-up box "Write the changes to disks?".
- Choose your location (this sets the right timezone) and keyboard
layout.
- When prompted for your name, for this instruction set we have used
  the name "user01".  You may like to use your own name instead.
  Subsequent occurences of using "user01" in this instruction set
  should be replaced by your username.
- We have shortened the auto-filled computer name from
  "user01-VirtualBox" to simply "VirtualBox", as this simplifies the
  subsequent command prompt inside the environment.
- The subsequent install takes a few minutes.
- When the installation is complete, you will need to restart the
environment when prompted to do so (and press enter when prompted).
On restart you will see it prompt "user01" for the password.
- If you open up a terminal (right-click and select "Open Terminal"
  you should see a terminal with the command prompt
  ```user01@VirtualBox:~$```.
- If at any point in the process you have a box asking you if you
would like to upgrade to a later Ubuntu version, do not upgrade. 

## Preparation for Installing OpenVINO

- You have the openvino tar file on the USB stick.  Put this into your
host computer.  It should be recognised by the guest system. 
- Close the window that shows the contents of the stick.  This may or
  may not influence whether the subsequent copy of the file completes
  properly.  Basic copying from a USB stick in Ubuntu is buggy, so it
  is worth checking that the file copies across OK.
- Copy the ```l_openvino_toolkit_p_2018.3.343.tar``` file from the USB
  to the Downloads directory.  You can do this using the windows GUIs,
  or at the command prompt by
  ```
  cd /Downloads
  cp /media/ubuntu/{MEM_STICK_NAME}/l_openvino_toolkit_p_2018.3.343.tar .
  ```
- If all has gone well, the 1.3 GB file copies across entirely.
- (Also copy across the .sh files - to expand on).
- There may be another option for this step where we share a folder
  with the host system, and have the .tar file on the host, and then
  copied into the guest system.
- Eject the USB stick (the option is available by right-click from the
USB icon).
- Check the file copied across OK.  ```ls -lah``` at the command
  prompt should show a 1.3 GB file.
- Go the the Downloads directory by doing ```cd Downloads/```.  Extract from the
.tar file by
```
tar -xf l_openvino_toolkit_p_2018.3.343.tar
```
- The above step is virtually instantaneous, and creates a directory
called ```l_openvino_toolkit_p_2018.3.343``` in the same ```/Downloads```
directory.

## Log in as the root user

- Log in as the root user: ```sudo -i``` This means all of the
subsequent installs have root user permissions, and that subsequent
installs that would otherwise need to be preceeded by "sudo" do not
need to be, as you are already the root user.
- If you are the root user, the prompt will be ```root@VirtualBox:~#```.
  Note how the terminal prompt ends in "#" rather than "$".

## Some other handy installs

- This is a good moment to install any other requirements.
- Ensure your other favourite editor is available (e.g. nano).  If you
want another editor like ```emacs```, then you will need to install it with
```sudo apt install emacs```.
- ```sudo apt install tree``` (it's a nice utility that displays the
  subdirectory tree neatly if you type "tree" at the command prompt.
- ```sudo apt install python-pip``` (check)
- ```sudo pip install --upgrade pip``` (check)

This is a good moment to test that the webcam is working.  Plug it in,
run cheese by typing ```cheese``` at the command prompt.

You might also want to define any other preferred options,
e.g. ```alias ls='ls -lah --color=auto'```

## Installing OpenVINO

```
cd Downloads/l_openvino_toolkit_p_2018.3.343/
./install_cv_sdk_dependencies.sh
```
Then run the GUI installation (root access is required).  The only
outstanding issue is that the OpenCL driver is missing - this is
sorted out afterwards, so run with it.
```
sudo ./install_GUI.sh
```

When the above runs, a browser window pops up with
subsequent instructions.  These instructions are actually the ones we
continue to outline below in this README, therefore it is OK for you
to minimise this browser window for reference should you need it.

Install the missing OpenCL driver:
```
cd /opt/intel/computer_vision_sdk/install_dependencies/
sudo -E ./install_NEO_OCL_driver.sh
```

We are now on the instruction track that is in the HTML that popped
up.

## Compiling examples

You can follow the instructions in the HTML pop-up window.  To make
things easier we have scripted the sequence in the file
```intel_examples.sh```, which is one of the files in this repo.  When
you obtain this script, you may well need to set executable
permissions by doing ```chmod u+x intel_examples.sh```.

```
cd /home/user01/Downloads/
./intel_examples.sh
```

There are some pre-defined commands in the ```commands.sh``` file.
To activate those, do
```
source /home/user01/Downloads/commands.sh
```

Finally, to run the face recognition example:
```
cd $ISAMPLES
$RUNFACE1
```

## OpenVINO resources

[Installing the OpenVINO Toolkit for Linux](https://software.intel.com/en-us/articles/OpenVINO-Install-Linux)




