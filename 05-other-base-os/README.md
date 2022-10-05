# Other base OS images

Create FID image with other base OS and run as radiantone:radiantone or 1000:1000 user (non-root).

## Build image with redhat/ubi8-minimal base image

```
docker build -t radiantone/fid-ubi8-minimal:7.4.2 -f Dockerfile.ubi8-minimal .
```
** Using  buildx **
```
docker buildx build --platform=linux/amd64 -t radiantone/fid-ubi8-minimal:7.4.2 -f Dockerfile.ubi8-minimal .
```

## Build image with redhat/ubi8 base image

```
docker build -t radiantone/fid-ubi8:7.4.2 -f Dockerfile.ubi8 .
```
** Using  buildx **
```
docker buildx build --platform=linux/amd64 -t radiantone/fid-ubi8:7.4.2 -f Dockerfile.ubi8 .
```

## Build image with centos:centos8 base image

```
docker build -t radiantone/fid-centos8:7.4.2 -f Dockerfile.centos8 .
```
** Using  buildx **
```
docker buildx build --platform=linux/amd64 -t radiantone/fid-centos8:7.4.2 -f Dockerfile.centos8 .
```


## Build image with other RHEL flavors

```
docker build -t radiantone/fid-rockylinux:7.4.2 --build-arg BASE_IMAGE=rockylinux --build-arg=BASE_TAG=9.0  -f Dockerfile.ubi8 .
```

```
docker build -t radiantone/fid-rockylinux-minimal:7.4.2 --build-arg BASE_IMAGE=rockylinux --build-arg=BASE_TAG=9.0-minimal  -f Dockerfile.ubi8-minimal .
```
