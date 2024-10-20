#!/bin/bash
#!/bin/bash

# Detect Linux Distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$ID
else
    echo "Unable to detect the Linux distribution."
    exit 1
fi

# Install Git based on detected distro
case "$distro" in
    arch|manjaro)
        echo "Detected Arch-based distro. Using pacman."
        sudo pacman -S git --noconfirm
        ;;
    ubuntu|debian)
        echo "Detected Ubuntu/Debian-based distro. Using apt."
        sudo apt update && sudo apt install git -y
        ;;
    fedora)
        echo "Detected Fedora. Using dnf."
        sudo dnf install git -y
        ;;
    centos|rhel)
        echo "Detected CentOS/RHEL. Using yum."
        sudo yum install git -y
        ;;
    *)
        echo "Unsupported distro: $distro"
        exit 1
        ;;
esac

# Collect user details
read -p "Enter fullname: " fullname
read -p "Enter email: " email
read -p "Standard folder: " gitrep

echo "You have typed:"
echo "Name:  $fullname"
echo "Email: $email"

read -p "Confirm (Y/N): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Exiting..."
    exit 1
fi

# Create the standard folder and configure git
mkdir -p ~/"$gitrep"
cd ~/"$gitrep" || exit

git config --global user.name "$fullname"
git config --global user.email "$email"

echo "You have installed Git and your work folder is ~/$gitrep"

# Register SSH key
ssh-keygen -t rsa -b 4096 -C "$email"
