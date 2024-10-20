#Check linux distro

#Arch/Manjaro
sudo pacman -S docker docker-compose --noconfirm
sudo systemctl start docker.service
sudo systemctl enable docker.service

sudo usermod -aG docker $USER
newgrp docker
# Test docker
# docker run hello-world
