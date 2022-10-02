# Other base OS images

Create FID image with other base OS and run as radiantone:radiantone or 1000:1000 user (non-root).

## Build image with redhat/ubi8-minimal base image

```
docker buildx build --platform=linux/amd64 -t radiantone/fid-ubi8-minimal:7.4.2 -f Dockerfile.ubi8-minimal .
```

## Build image with redhat/ubi8 base image

```
docker buildx build --platform=linux/amd64 -t radiantone/fid-ubi8:7.4.2 -f Dockerfile.ubi8 .
```

## Build image with centos:centos8 base image

```
docker buildx build --platform=linux/amd64 -t radiantone/fid-centos8:7.4.2 -f Dockerfile.centos8 .
```


