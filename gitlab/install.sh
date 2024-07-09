
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

