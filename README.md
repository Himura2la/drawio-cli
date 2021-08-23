```sh
git submodule update --init --recursive
docker build -t drawio .
docker run -it --rm drawio -V
```
