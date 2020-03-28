# A minimal Docker example

This repo contains the minimal working example for working with docker according to my personal needs.
In order to run it, first [install Docker](https://docs.docker.com/install/). Note I ran this on Ubuntu,
although the procedure should work for Mac as well.

1. Run the command:
```console
frank@pc:~$ docker build -t image_name .
```
What this command is doing is building the dockerfile into a docker image. This image is not yet a container, but now any component that needed downloading or installing is ready. Two things should be noted about this command. One is the `-t image_name` flag, which specifies
(unsurprisingly) that the name of this particular built image is "image_name". The `.` at the end of the command specifies where docker
should look for the dockerfile. This is also the working directory for any command issued within the dockerfile, like `COPY`.
2. Now you have a built image. You can see that it's there by issuing:
```console
frank@pc:~$ docker images
```
This listing will also show the image's ID. At any point you can remove an image by issuing:
```console
frank@pc:~$ docker rmi [IMAGE_ID]
```
3. Now you're ready to run the image by making it into a container. The container exists as soon as its process terminates.
Do this by issuing:
```console
frank@pc:~$ docker run -v ~/Documents/docker_minimal_example:/app image_name
```
This command is doing two things. By using the `-v` flag, it's mounting the host directory `~/Documents/docker_minimal_example` onto the
container directory `/app`. This means that now our script can read the input file located in `./data` for instance, as well as write
into a new output file in `./data`.
4. If at any point you wanted to delete this container (which you want to do when deleting an image that the container is based on), you can
start by listing all of your containers by issuing:
```console
frank@pc:~$ docker ps -a
```
Then in a similar fashion as for deleting images, run:
```console
frank@pc:~$ docker rm [CONTAINER_ID]
```