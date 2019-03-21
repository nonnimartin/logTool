###Build Image
Get Fusion 4.2.0 (or update relevant lines in Dockerfile) and place in working directory with Dockerfile and fusion.properties file
`docker build -t <IMAGE_NAME> .`

###Run Container
Start the container running and map the VMs ports to the local ports you want to use in your environment
`docker run -d -p 8983:<LOCAL_PORT> -p 8764:<LOCAL_PORT> <IMAGE_NAME>:latest`

###Helpful Commands
docker ps
docker ps -a
docker images
docker logs <image hash>
