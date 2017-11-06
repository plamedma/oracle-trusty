# Oracle client Docker Image

This is an Ubuntu 14.04 (Trusty) derived image containing Oracle database client and sqlplus executable

## Build the image on your own
Before building your own image you need to download  instantclient rpm  and sqlplus rpm.
Convert rpm downloaded files to .deb files using "alien" tool.
Copy these 2 .deb files in resources forlder.
```bash
$ git clone https://github.com/plamedma/oracle-trusty.git
$ cd oracle-trusty
$ docker build -t oracle-trusty .
```

## Use image from DockerHub
```bash
docker pull plamedma/oracle-trusty
```
