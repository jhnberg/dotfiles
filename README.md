# DotFiles

My personal dot files for Linux.

#### Docker

A minimal docker container can be created which sets up a lightweight
approximation of the environment for development, experimentation or for
setting up another system.

1. Create the docker container:

```bash
docker build -t $CONTAINER_TAG .
```

**NOTE:** You can edit the make.conf file before building the container to
          customise the image.

2. Run the created docker container:

```bash
docker run --interactive --tty --rm $CONTAINER_TAG
```

---

The setup only includes a small number of packages for making the container
usable. The packages also has to be compiled from source, so limiting the
number of packages which are installed also help reduce the installation time.
