# Oracle client Docker Image

This is an Ubuntu 14.04 (Trusty) derived image containing Oracle database client and sqlplus executable

## Build the image on your own
Before building your own image you need to download 
```bash
$ git clone https://github.com/plamedma/oracle-trusty.git
$ cd oracle-trusty
$ docker build -t oracle-trusty .
```

## Use image from DockerHub
```bash
docker pull plamedma/oracle-trusty
```
