# Docker Image for AMS 595
This Docker image provides the Ubuntu 16.04 environment with X Windows for the class
"AMS 595: Fundamental of Computing" at Stony Brook University.
The course covers programming using MATLAB/Octave, Python, and C++. This image runs the lightweight LXDE Windows Manager, and has Octave 4.0.2, Python 3.5.2 (with NumPy, SciPy, Pandas and Spyder),
gcc 5.4.0, Jupyter Notebook with Octave and Python kernels, Atom, and ddd preinstalled. The X Windows will display in your web browser in full-screen mode. You can use this Docker image on 64-bit Linux, Mac or Windows. It allows you to use the same programming environment regardless which OS you are running on your laptop or desktop.

![screenshot](https://raw.github.com/compdatasci/ams595-desktop/master/screenshots/screenshot1.png)

[![Build Status](https://travis-ci.org/compdatasci/ams595-desktop.svg?branch=master)](https://travis-ci.org/compdatasci/ams595-desktop) [![](https://images.microbadger.com/badges/image/ams595/desktop.svg)](https://microbadger.com/images/ams595/desktop)

## Preparation
Before you start, you need to first install Python and Docker on your computer by following the steps below.

### Installing Python
If you use Linux or Mac, Python is most likely already installed on your computer, so you can skip this step.

If you use Windows, you need to install Python if you have not yet done so. The easiest way is to install `Miniconda`, which you can download at https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe. You can use the default options during installation.

### Installing Docker
Download the Docker Community Edition for free at https://www.docker.com/community-edition#/download and then run the installer. Note that you need administrator's privilege to install Docker. After installation, make sure you launch Docker before proceeding to the next step.

**Notes for Windows Users**
1. Docker only supports 64-bit Windows 10 Pro or higher. If you have Windows 8 or Windows 10 Home, you need to upgrade your Windows operating system before installing Docker. Stony Brook students can get Windows 10 Education free of charge at https://stonybrook.onthehub.com. Note that the older [Docker Toolbox](https://www.docker.com/products/docker-toolbox) supports older versions of Windows, but it should not be used.
2. After installing Docker, you may need to restart your computer to enable virtualization.
3. When you use Docker for the first time, you must change its settings to make the C drive shared. To do this, right-click the Docker icon in the system tray, and then click on `Settings...`. Go to `Shared Drives` tab and check the C drive.

**Notes for Linux Users**
* After you install Docker, make sure you add yourself to the Docker group by running the command:
```
sudo adduser $USER docker
```
Then, log out and log back in before you can use Docker.

## Running the Docker Image
To run the Docker image, first download the script [`ams595_desktop.py`](https://raw.githubusercontent.com/compdatasci/ams595-desktop/master/ams595_desktop.py)
and save it to the working directory where you will store your codes and data. You can download the script using command line: On Windows, start `Windows PowerShell`, use the `cd` command to change to the working directory where you will store your codes and data, and then run the following command:
```
curl https://raw.githubusercontent.com/compdatasci/ams595-desktop/master/ams595_desktop.py -outfile ams595_desktop.py
```
On Linux or Mac, start a terminal, use the `cd` command to change to the working directory, and then run the following command:
```
curl -s -O https://raw.githubusercontent.com/compdatasci/ams595-desktop/master/ams595_desktop.py
```

After downloading the script, you can start the Docker image using the command
```
python ams595_desktop.py -p
```
This will download and run the Docker image and then launch your default web browser to show the desktop environment. The `-p` option is optional, and it instructs the Python script to pull and update the image to the latest version.

You can start the Docker image with `MATLAB` using the command
```
python ams595_desktop.py -p -m
```
where the `-m` option would request installation of MATLAB. It will prompt you to authenticate using your Google account to download MATLAB. After the download completes, MATLAB will start automatically inside the desktop, and you may be asked to activate MATLAB using your MathWorks account. The authentication and activation need to be done only once.

For additional command-line options, use the command
```
python ams595_desktop.py -h
```

### Running the Docker Image as Jupyter-Notebook Server
Besides using the Docker Image as an X-Windows desktop environment, you can also use it as a Jupyter-Notebook server with the
default web browser on your computer. Simply replace `ams595_desktop.py` with `ams595_jupyter.py` in the preceding commands. That is, on Windows use the following commands in the PowerShell:
```
curl https://raw.githubusercontent.com/compdatasci/ams595-desktop/master/ams595_jupyter.py -outfile ams595_jupyter.py
python ams595_jupyter.py -p
```
and on Linux and Mac use the following commands in a terminal:
```
curl -s -O https://raw.githubusercontent.com/compdatasci/ams595-desktop/master/ams595_jupyter.py
python ams595_jupyter.py -p
```

### Running the Docker Image Offline
After you have download the Docker image using the `curl` and `python` commands above, you can run the image offline without internet connection using the following command:
```
python ams595_desktop.py
```
or
```
python ams595_jupyter.py
```
in the directory where you ran the `curl` command above.

### Stopping the Docker Image
To stop the Docker image, press Ctrl-C twice in the terminal (or Windows PowerShell on Windows) on your host computer where you started the Docker image, and close the tab for the desktop in your web browser.

## Entering Full-Screen Mode
After starting the Docker image, you can change your web browser to full-screen mode, so that the LXDE desktop environment would occupy the whole screen.

For the best cross-platform solution, we recommend *Google Chrome* or *Chromium browser*, which have the same user interface. On Windows or Linux, you can enter full-screen mode by selecting the menu `View --> "Full Screen"` Alternatively, open the Chrome menu (the three vertical dots at the top right) and select the square to the far right of the Zoom buttons (the "+" and "-" buttons). To exit the full-screen mode, press the `F11` key. On Mac, it behaves similarly except that the menu item is named `Enter Full Screen` instead of `Full Screen`, and the keyboard shortcut is `Ctrl-Cmd-f` instead of `F11`. You can also click on the green circle at the top-left corner of *Google Chrome* to enter and exit the full-screen mode. Note that in the full-screen mode, you need to disable `Always Show Toolbar in Full Screen` under the `View` menu of `Google Chrome`, and you can reveal the menu and the toolbar by sliding your mouse to the top of the display.

Alternatively, you can also use the "native" browsers on different platforms.
- On Windows, you can use the native browser *Microsoft Edge*. Toggle on and off the full-screen mode by pressing Win+Shift+Enter (hold down the Windows and Shift keys and press Enter).
- On Mac, you can use the native browser *Safari*, for which you can toggle the full-screen mode by clicking on the green circle at the top-left corner of *Safari* or selecting the `View --> "Enter Full Screen"` menu. To exit the full-screen mode, press `Ctrl-Cmd-f`, or slide your mouse to the top of the display to enable the menus.
- On Linux, the default browser *Firefox* does not hide its address bar in its native full-screen mode. You are recommended to use *Google Chrome* or *Chromium browser* instead. However, you can use *Firefox* for a full-screen viewing mode by clicking on the `Fullscreen` button in the left sidebar of Docker desktop environment. However, this is not recommended for day-to-day use, because *Firefox* would exit this full-screen mode whenever you press `Esc`, which may happen quite often.

If your Docker desktop environment started automatically in a non-recommended browser, you can copy and paste the URL into a recommended browser.

## Tips and Tricks
1. By default, Docker uses two CPU cores and 2GB of memory on Mac or Linux. If you want to run large jobs, go to the `Advanced` tab in `Settings` (or `Preferences` for Mac) and increase the amount of memory dedicated to Docker.
2. When using the Docker image, the files under `$HOME/.config`, `$HOME/.ssh` and `$HOME/shared` are persistent. Any change to the files in other directories will be lost when you stop the Docker image. Make sure you save all your source codes in $HOME/shared`.
3. The `$HOME/.ssh` directory in the Docker image maps to the `.ssh` directory on your host computer. This is particularly convenient for you to use your ssh-keys for authentications with git repositories on github.com or bitbucket.org. To use your ssh-keys, run the `ssh-add` in a terminal to add your keys to the ssh-agent.
4. You can copy and paste between the host and the Docker image through the `Clipboard` box in the left toolbar, which is synced automatically with the clipboard of the Docker image. To copy from the Docker image to the host, first, select the text in the Docker image, and then go to the `Clipboard` box to copy. To copy from host to the Docker image, first, paste the text into the `Clipboard` box, and then paste the text in the Docker image.
