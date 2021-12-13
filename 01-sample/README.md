# 01-sample
Creating a sample docker image from a existing radiantone/fid image and running with custom commands.

## Prerequsites
- Understand what are docker images[Read](https://www.tutorialspoint.com/docker/docker_images.htm)
- How to build docker images from existing image

## Custom configuration on your custom fid image

You can use commands file presented in this folder to run some custom commands after FID is started

In this example commands file provided you can see we are creating a HDAP store and proxy as well

Feel free to add custom logic to the commands file and please evaluate with RadiantLogic in case you have any issue

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


