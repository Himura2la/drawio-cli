```sh
git submodule update --init --recursive
docker build -t drawio .
docker run --rm --name drawio -dt drawio

docker exec drawio drawio -h
# do what you need

docker stop drawio
```
