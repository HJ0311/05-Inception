#####################
# Install essential #
#####################

sudo apt-get update -y --no-install-recommends
sudo apt-get install vim -y --no-install-recommends
sudo apt-get install make -y --no-install-recommends

##################
# Install Docker #
##################

# Add Docker's official GPG key
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# To install the lastest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo mkdir -p /home/hyehan/data/MariaDB
sudo mkdir -p /home/hyehan/data/WP