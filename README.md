# docker-jenkins

Jenkins master and build slaves running in Docker and/or AWS ECS

### Credits

Most of the contents of this repo started out here:
https://github.com/maxfields2000/dockerjenkins_tutorial

I've removed the tutorials and just kept what was needed for a Jenkins 2 master and
Docker-In-Docker slaves. 

**Important**
 
The slaves are given access to the docker socket (/var/run/docker.sock) from the host. 
Special consideration needs to be given to avoid removing data, master and slave
containers, images and volumes.