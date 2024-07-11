
#1. Install and configure the necessary dependencies

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl


#2. Add the GitLab package repository and install the package
#curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

#2. alternative for CE
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash


#sudo EXTERNAL_URL="http://gitlab.localdomain" apt-get install gitlab-ee

sudo EXTERNAL_URL="http://gitlab.localdomain" apt-get install gitlab-ce


# List available versions: apt-cache madison gitlab-ee
# Specifiy version: sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee=16.2.3-ee.0
# Pin the version to limit auto-updates: sudo apt-mark hold gitlab-ee
# Show what packages are held back: sudo apt-mark showhold

#3. Browse to the hostname and login
sudo cat /etc/gitlab/initial_root_password

    echo -e "192.168.123.10\tubuntu-bionic\tubuntu-bionic" >> /etc/hosts
    echo -e "192.168.123.10\tgitlab.localdomain\tgitlab" >> /etc/hosts

docker pull gitlab/gitlab-runner:latest
docker pull sonarsource/sonar-scanner-cli:latest
docker pull golang:1.17
docker pull docker:latest

192.168.123.10


   docker run -ti --rm --name gitlab-runner \
     --network host \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest register

sudo nano /srv/gitlab-runner/config/config.toml 

#Конфигурация раннера для docker-in-docker:

    volumes = ["/cache", "/var/run/docker.sock:/var/run/docker.sock"]
    extra_hosts = ["gitlab.localdomain:192.168.123.10"]

sudo    docker run -d --name gitlab-runner --restart always \
     --network host \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest
git clone https://github.com/hachubra/sdvps-materials.git my_project1
git remote add project1 http://gitlab.localdomain/group1/project1.git

#sonarqube
cd ~/projects/my_project1/gitlab
sudo sysctl vm.max_map_count=262144
#install docker compose



mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version

cd ~/projects/my_project1/gitlab
docker compose up -d