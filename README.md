### Build Image
Get Fusion 4.2.0 (or update relevant lines in Dockerfile) and place in working directory with Dockerfile and fusion.properties file
`docker build -t <IMAGE_NAME> .`


### Run Container
Start the container running and map the VMs ports to the local ports you want to use in your environment
`docker run -dit --privileged=true -p <LOCALPORT>:8764 -p <LOCALPORT>:8983 <IMAGE_NAME>:latest`


### Pause and Unpause Container

Get container id:

`docker ps`

To pause container:

`docker pause <container_id>`

To unpause container:

`docker unpause <container_id>`


### Helpful Commands

`docker ps`

`docker ps -a`

`docker images`

`docker logs <image hash>`



### SSH to the Docker container
If you need to ssh into the Docker VM, use `docker ps` to get the container id,
and use the command:

`docker exec -it <container_id> /bin/bash`


