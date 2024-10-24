#Check linux distro

#Arch/Manjaro
sudo pacman -S docker docker-compose --noconfirm
sudo systemctl start docker.service
sudo systemctl enable docker.service

#add user to docker group
sudo usermod -aG docker $USER
newgrp docker

sudo pacman -S nvidia-container-toolkit

# Test docker
# docker run hello-world
