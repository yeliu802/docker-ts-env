##Tensorflow Docker Env

### Install Docker on Amazon Linux 2
```
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

docker info
```

```
ERROR: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
sudo chmod 666 /var/run/docker.sock
```

###Install docker compose

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
// start -d  daemon mode
docker-compose up -d  
// resstart
docker-compose up -d --force-recreate  --remove-orphans

docker stop $(docker ps -q)    stop all containers

docker stop $(docker ps -q) && docker ps -q

```
#Install git
`sudo yum install git -y`


Environment structure (under /home/ec2-user)
```
~/
├── docker-ts-env
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── notebook
│   └── README.md


```

Creating command


Docker Commands
```
sudo systemctl start docker

docker build -t [image-name]:[version|tag] .

docker images           // list images
docker rmi [name]       // remove image

docker ps -a            // List containers 
docker rm -f name       // Delete container  

docker run -d --name [name] -p 8080:80
-d daemon mode
--name defined name
-p Host ip：port：Container port
docker run -d -p 8080:80 --name nginx [db9d7ac4c6ed|image id]   // ex

docker container restart [id]
docker stop [id]
```

###Docker terminal

```
docker exec -it [containerId] /bin/bash 

`exit` exit terminal
```


###Modification of config of modules
```
1. stop container
docker stop $(docker ps -q)     // stop all

2. remove related container
docker rm [ids]

3. remove related images
docker rmi [ids]

4. start docker via comopose
docker-compose up -d

```

###Jupyter notebook setting
Initial password: '123'
```
{
  "ServerApp": {
    "password": "argon2:$argon2id$v=19$m=10240,t=10,p=8$xGTPG10vAtHbZe1x0JE7OQ$NV4DpAmThMK7lacS9f3QFQ"
  }
}
```
or generate password using following code in notebook
```
from notebook.auth import passwd
passwd()
```