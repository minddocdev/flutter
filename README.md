# flutter

Lightweight ubuntu docker image with all the dependencies to run flutter test,
tagging stable versions.

## Docker Hub

### `docker pull`

You can pull the image from Docker Hub using the `docker pull minddocdev/flutter` command.
We use [automated build set up](https://docs.docker.com/docker-hub/builds/#create-an-automated-build).

```sh
docker pull minddocdev/flutter
```

### `docker run`

To jump into the container's `bash` shell

```sh
docker run -it minddocdev/flutter /bin/sh
```

For instance, if you want to generate golden files locally (useful to be checked on CI):

```sh
docker run -ti -v ${PWD}:/myproject -w /myproject minddocdev/flutter \
/bin/sh -c "flutter packages get && flutter test --update-goldens test"
```

### `docker build`

You can also build the image yourself. Checkout the repository

```sh
git clone https://github.com/minddocdev/flutter
cd flutter
docker build -t minddocdev/flutter .
docker images minddocdev/flutter
```

# Links

- [Docker Hub `minddocdev/flutter`](https://hub.docker.com/r/minddocdev/flutter)
- [GitHub `minddocdev/flutter`](https://github.com/minddocdev/flutter)
- [brianegan/flutter](https://hub.docker.com/r/brianegan/flutter/dockerfile)
