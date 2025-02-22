# Build, Run, and Debug with a Docker Container

## Introduction

This guide provides instructions on how to build and run a Docker container with debugpy for debugging Python applications. The setup leverages VSCode for a smooth development and debugging experience.

The advantage of this approach is the ability to automate creating consistent Python environments for development projects.  Developers can share containers and be confident there will be no integration issues.  Further, production containers could be built with few changes.

## Summary

This example demonstrates:
- Building a Docker container with the required dependencies.
- Mapping code and data directories as volumes to the container.
- Using environment variables for different environments (e.g., prod, debug).
- Simplifying commands with the `make` utility.

## Environment

- **Operating System:** Windows 11 with WSL2 enabled
- **VSCode Extensions:**
  - GitHub Copilot
  - Microsoft Python extension
  - Docker extension (optional, commands are in the Makefile)

## Setup Instructions

### 1. Check WSL Version

To check the WSL version, run the following command:

```sh
make wsl_version
```

### 2. Build container
* Fix IMAGE_NAME in Makefile.
* Dockerfile step order is important so that you only rebuild the container when there is a new python package; otherwise, there is no need to rebuild the Docker container.
* See Dockerfile:
  * Start from python image.
  * Install make utilities.
  * Pip install python packages.
  * Set work directory and copy code into /app.
  * Add a user for the container.
* Execute:
  ```sh
  make build_container
  ```

### 3. Run container for debugging
* Fix the **LOCAL_USER** variable in Makefile to help point to app source code
* Make a "data" volume with a **prod** subfolder to demonstrate *environments* 
  * something like **c:/var/data**
    * make **prod** and **dev** subfolders
* Setup Python: Remote Attach in launch.json
```
    "configurations": [
            {
                "name": "Python: Remote Attach",
                "type": "python",
                "request": "attach",
                "connect": {
                    "host": "localhost",
                    "port": 5678
                },
                "pathMappings": [
                    {
                        "localRoot": "${workspaceFolder}",
                        "remoteRoot": "."
                    }
                ],
                "justMyCode": true
            }
        ]
```
* Run container to prepare to debug app.py
  * execute:
  ``` 
    make run_bash
  ```
    * this starts the container running bash... 
* Open app.py in VSCode and put a breakpoint near the top 
* Inside the container, execute:
  * **note the module to debug is at the end of the command and could be paramaterized**
``` 
    make run_debug
```
* Click the VSCode **Python: Remote Attach**
  * you will stop at the break point, use the toolbar, hotkeys to debug... 
  * make code changes and save
  * restart by :
    * Ctrl-C (**restart on the toolbar also ends the run**)
    * make run_debug
* **After running *app.py* check the prod directory for the log contents written during the execution**

## Run container to debug testing
* Same... run_bash
* Put a break point in the test to debug
* Fix *test_debug* target with file to debug
* Execute
```
    make test_debug
```
* Click the VSCode **Python: Remote Attach**

### Stop the container
* From the bash prompt, execute:
```
    exit
```