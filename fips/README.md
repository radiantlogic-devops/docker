# FIPS Mode

## In FIPS mode, RadiantOne performs all cryptographic operations using the Radiant Logic Cryptographic Module for Java. This includes key generation and key derivation, message digests and message authentication codes, random number generation, symmetric and asymmetric encryption, signature generation and verification, etc.

**IMPORTANT NOTE - Enabling FIPS mode required cluster downtime.**

### Steps to be followed:-

1. Install the [scripts.sh](http://scripts.sh) 
2. Create a Docker image using the above Dockerfile.
- If you are planning to create this image from your local machine.Copy the Dockerfile to a folder on your local machine.
- Build the Docker image and tag it

```bash
$docker build -t fips .
```

   

- Now, push this image to your repository (*after login in*)

```bash
$docker push rli_test/fips:latest 
```

For deploying this image on Kubernetes, you can modify the fid.yaml

1. Rename the image and replace [run.sh](http://run.sh) with [scripts.sh](http://scripts.sh) in the args section

```yaml
containers:
        - name: myfid
          image: rli_test/fips
.
.
args:
            [
              "if [ $HOSTNAME != myfid-0 ]; then export CLUSTER=join; fi;./scripts.sh fg",
            ]
```

1. Apply the fid.yaml

```bash
$kubectl apply -f fid.yaml
```

### Verification:-

You can run this command inside the pod to check if FipsMode is enabled

```bash
$kubectl exec --stdin --tty myfid-0 -- /bin/bash

$opt\radiantone\vds\bin>vdsconfig.sh list-properties | grep fips*
    "fipsMode" : true,

```
