""" this demonstrates how to run python in a docker container with volumes and debugpy """

import sys

# import debugpy

import logging
import os
import getpass


# all things cfg - configuration
def main():
    if getpass.getuser() == "appuser":
        # running in a container
        env = "/test-volume" + "/" + os.environ["ENV"]
    else:
        env = f"/Users/{getpass.getuser()}/dev-projects/test-volume"

    fname = env + "/app.log"

    
    logging.basicConfig(
        level=logging.INFO, format="%(asctime)s %(message)s", filename=fname
    )
    logging.info(f"New run *****")
    os_version = os.uname() if hasattr(os, 'uname') else "OS information not available"
    logging.info(f"OS Version: {os_version}")
    logging.info(f"Python Version: {sys.version}")
    logging.info(f"Executable: {sys.executable}")
    logging.info(f"Environment: {env}")
    logging.info(f"Current user : {getpass.getuser()}")

    print(f"New run *****")
    print(f"OS Version: {os_version}")
    print(f"Python version : {sys.version}")
    print(f"Current user : {getpass.getuser()}")
    print(f"Executable: {sys.executable}")
    print(f"Environment: {env}")

    print("hello world - new")
    print("line 2 - 842am")


if __name__ == "__main__":
    main()
