# Project 4: Introduction to the Design of Information Technology Systems - CEG3120

## Name: Chase Ennis  

### Part 1

1. Installing `docker`:
   * `sudo apt update`
   * `sudo apt install -y apt-transport-https ca-certificates curl software-properties-common`
   * `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
   * `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
   * `sudo apt update`
   * `sudo apt install docker-ce`
   * `sudo systemctl start docker`
   * `sudo systemctl enable docker`
   * sudo usermod -aG docker $USER 
   * ![Status](images/working.png)
   * [Containerize an Application](https://docs.docker.com/get-started/02_our_app/)








