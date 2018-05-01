# rancher2img
Example how to sync Docker images for a specific Rancher 2 release

## Usage

### Script only

```
Usage: ./entrypoint.sh [REGISTRY] [VERSION]
```

Example:

```
./entrypoint.sh registry.yourdomain.com:5000 v2.0.0
```


### Docker image

```
docker run -v /var/run/docker.sock:/var/run/docker.sock superseb/rancher2img:latest registry.yourdomain.com:5000 v2.0.0
```
