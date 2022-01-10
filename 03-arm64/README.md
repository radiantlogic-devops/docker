# ARM64 Dockerfile

Images that are available for production are linux/amd64 os/arch on https://hub.docker.com/u/radiantone, If you are looking to run those images on arm64 based machine you will have to swap out JDK shipped in those images with corresponding ARM64 jdk version, Which has been illustrated in these following dockerfiles and building them on any machine using `docker buildx`

# Pre-Check

Check if you have linux/arm64 available on your docker daemon by running this command
```
docker buildx inspect
```

Build zookeeper arm64 image
```
# remove --push if you are not looking to push to repo
docker buildx build -t radiantone/zookeeper:3.5.8-arm64 --platform linux/arm64 --push -f zk_Dockerfile .
```
Build fid arm64 image
```
# remove --push if you are not looking to push to repo
docker buildx build -t radiantone/fid:7.3.21-arm64 --platform linux/arm64 --push -f fid_Dockerfile .
```

Running FID ARM64 image on other plaforms will require `--paltform linux/arm64` flag
```
export LICENSE="PASTE_LICENSE_HERE"
docker run -it --hostname=myfid -e LICENSE="${LICENSE}" -p 7070:7070 -p 7171:7171 -p 8089:8089 -p 8090:8090 -p 2389:2389 -p 2636:2636 radiantone/fid:7.3.21-arm64
```

Run these below Dockerfile to find our java version packaged inside fid or zookeeper image from radiantone
> Use --progress=plain to observer build log
```
# docker build -t radiantone/zookeeper:3.5.8-arm64 --progress=plain --no-cache -f zk_Dockerfile .
# CHECK ZK JAVA VERSION Dockerfile
FROM radiantone/zookeeper:3.5.8 as source
RUN tar xf zookeeper.tar.gz
RUN rli-zookeeper-external/jdk/bin/java -version
```
```
# docker build -t radiantone/fid:7.3.21-arm64 --progress=plain --no-cache -f fid_Dockerfile .
# CHECK FID JAVA VERSION Dockerfile
FROM radiantone/fid:7.3.21 as source
RUN tar xf installer.tar.gz
RUN vds/jdk/bin/java -version
```