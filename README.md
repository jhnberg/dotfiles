# DotFiles

My personal dot files for Linux.

#### Docker

A minimal docker container can be built using:

```
docker build -t sandbox .
```

**NOTE:** You can edit the make.conf file before building the container to
customise the image.

Run the created docker container using:

```
docker run --interactive --tty --rm sandbox
```

This is not an complete setup as building the packages can take a while, but
the container should approximate the desired system. This is useful for
experimentation, but could also be used for setting up an installation for
another system.
