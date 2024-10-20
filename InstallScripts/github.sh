#TODO: Check linux-distro
sudo pacman -S git --noconfirm

# fullname="USER INPUT"
read -p "Enter fullname: " $fullname
# user="USER INPUT"
read -p "Enter email: " $email
read -p "Standard folder: $gitrep

echo "You have typed"
echo "Name:  " $fullname
each "Email: " $email
read -p "Confirm (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 1

mkdir ~/$gitrep
cd ~/$gitrep
git config --global user.name fullname
git config --global user.email email

echo "You have installed Git and your work folder is ~/" $gitrep

#Register ssh
ssh-keygen
ssh-copy-id username@remote_host
