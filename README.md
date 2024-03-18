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
   * sudo usermod -aG docker $USER (allows docker commands to be run without `root`
   * ![Status](images/working.png)
   * [Containerize an Application](https://docs.docker.com/get-started/02_our_app/)
2. Configuring `Dockerfile`:
   * ![Dockerfile](images/docker.png)
3. Setting Up
   * ` docker build -t chase_image -f /home/ubuntu/ceg3120/project4/Dockerfile /home/ubuntu/ceg3120/project4` (Builds the image)
   * `docker run -d -p 80:80 chase_image`
   * `docker run -d -p 8080:80 chase_image`
      * `-d` : detached mode which runs container in background
      * `-p 8080:80`: maps port `8080` on the host to port `80` inside the container
      * `chase_image`: name of the image
4. Proof
   * ![docker images](images/dockerimages.png)
   * ![docker ps -a](images/dockerpsa.png)
      * It is normal for the container IDs to be different. Every time the container is run, a new instance of that container is created
    




Documentation
Create README-CI.md in main folder of your repo that details the following:

CI Project Overview
(what are you doing, why, what tools)
Run Project Locally
how to install docker + dependencies (WSL2, for example)
how to build an image from the Dockerfile
how to run the container
how to view the project running in the container (open a browser...go to IP and port...)



