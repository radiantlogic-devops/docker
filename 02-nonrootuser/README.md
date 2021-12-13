# 02-nonrootuser
Creating a non-root fid image

> The radianone/fid image available on dockerhub runs as root user by default

This Dockerfile is example that illustrates on how to reuse the root image radiantone/fid and build a non root user image

If you take a look at the the Dockerfile you can find how a non root user is created and given access to radiantone folder access to execute fid.
```
# Provide a non-root user to run the process.
RUN groupadd --gid 1000 radiantone && \
    useradd --uid 1000 --gid 1000 -G 0 \
      --home-dir /opt/radiantone --no-create-home \
      radiantone

# Change the ownership
RUN chown -R radiantone:radiantone /opt/radiantone

# Change the User
USER radiantone
```

## Building docker image
```
# This command looks for Dockerfile in the current directory to build the image
docker build . --tag <TAG_NAME>
```
Example
```
docker build . --tag fid
```
## Setting up DockerHub repo (You can also use other free docker image repositories)
- Signup at https://hub.docker.com/
- Create a repository fid
- Now you will be provided with commands to push to the repo

## Pushing the image to repo
```
# Tag the exiting image with suggested tag provided by repo
# Make sure to replace username/fid with your tagname suggested by repo
docker tag fid username/fid
docker push username/fid
```




