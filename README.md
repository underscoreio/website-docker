# Docker Image for Building Underscore Website


To build the Docker image:

`docker build -t underscoreio/web .`

Once it is built, login and push it to Docker Hub

```bash
docker login
docker push underscore/web:latest
```
