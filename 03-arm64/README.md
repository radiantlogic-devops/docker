# ARM64 Dockerfile

Images available on Docker Hub (https://hub.docker.com/u/radiantone) for production are based on linux/amd64 os/arch platform. If you are looking to run those images on arm64 based machine you will have to swap out JDK shipped in those images with corresponding ARM64 jdk version. The process of building linux/arm64 images is described below using `docker buildx`

## Pre-Check

Check if you have linux/arm64 available on your docker daemon by running this command
```
docker buildx inspect
```
## Build Image
Build zookeeper arm64 image
```
# add --push if you want to push to a repo
docker buildx build -t radiantone/zookeeper:3.5.8-arm64 --platform linux/arm64 -f zk_Dockerfile .
```
Build fid arm64 image
```
# add --push if you want to push to a repo
docker buildx build -t radiantone/fid:7.4.9-arm64 --no-cache --pull --platform linux/arm64 -f fid_Dockerfile .
```
## Run Container
Running FID ARM64 image on other plaforms (non arm64) will require `--platform linux/arm64` flag
```
export LICENSE="PASTE_LICENSE_HERE"
docker run -it --hostname=myfid -e LICENSE="${LICENSE}" -e INSTALL_SAMPLES="true" \
-p 7070:7070 -p 7171:7171 -p 8089:8089 -p 8090:8090 -p 2389:2389 -p 2636:2636 -p 1527:1527 \
radiantone/fid:7.4.9-arm64
```
## Java Version
Run these below Dockerfile to find our java version packaged inside fid or zookeeper image from radiantone
> Use --progress=plain to observe build log
```
# docker build -t radiantone/zookeeper:3.5.8-arm64 --progress=plain --no-cache -f zk_check_java_Dockerfile .
# CHECK ZK JAVA VERSION Dockerfile
FROM radiantone/zookeeper:3.5.8 as source
RUN tar xf zookeeper.tar.gz
RUN rli-zookeeper-external/jdk/bin/java -version
```
```
# docker build -t radiantone/fid:7.4.9-arm64 --progress=plain --no-cache -f fid_check_java_Dockerfile .
# CHECK FID JAVA VERSION Dockerfile
FROM radiantone/fid:7.4.9 as source
RUN tar xf installer.tar.gz
RUN vds/jdk/bin/java -version
```
