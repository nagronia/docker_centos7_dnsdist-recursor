# docker-centos7_dnsdist-recursor

This is a really basic build using the official CentOS7 image to build a VERY basic DNSDist Recusor. 

To build the image use the following command...
Note: The last argument is the location of the folder...

`docker build -t nagronia/centos7_dnsdist-recursor ./docker_centos7_dnsdist-recursor/`

Then use the following command to run the image...
```
docker run -d \
  --name dnsdist-recursor01 \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/London \
  -p 53:53/udp \
  -p 53:53/tcp \
  nagronia/centos7_dnsdist-recursor
```

To review the logs for the container use the following command...

`docker logs dnsdist-recursor01`

To kill and remove the container us the following commands...
```
docker container kill dnsdist-recursor01
docker container rm dnsdist-recursor01
```


