# Build a docker container with debugpy and debug inside the container
* this is code to build a docker container so that you can debug within the container as part of the development process 
* pretty simple setup
  * build a python container with required dependencies
  * copy the code directory and map the code directory as a volume to the container
  * for demo, make another "data" folder and map as a volume
  * demonstrate using environment variables for different "environments" such as prod, debug, etc...
* development, debug setup is as smooth as using VSCode bit all container based
* use "make" to simplify commands from outside and inside the container
## Environment
* Windows 11 with WSL2 enabled
* execute:
```
    make wsl_version
```

## Build container
* fix IMAGE_NAME in Makefile
* see Dockerfile
  * start from python image
* execute:
```
    make build_container
```

