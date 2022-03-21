echo "----------------Let's start download!----------------"
sudo apt-get update 
sudo apt-get install apt-transport-https 
sudo apt-get install ca-certificates 
sudo apt-get install curl 
sudo apt-get install software-properties-common

echo "----------------Download Docker----------------"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" 
sudo apt update

echo "----------------Install Docker----------------"
apt-cache policy docker-ce
sudo apt install docker-ce

echo "----------------Install Docker-Compose----------------"
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0\
-rc2/docker-compose-`uname -s`-`uname -m` -o \
/usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v

echo "---------------- permission to root and Reboot----------------"
ls -al /var/run/docker.sock
sudo usermod -a -G docker $USER
sudo reboot