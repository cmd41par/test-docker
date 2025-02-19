import pandas as pd

import sys

# import debugpy

import logging
import os
import getpass

# all things cfg - configuration

if getpass.getuser() == "appuser":
    # running in a container
    env = "/test-volume" + "/" + os.environ["ENV"]
else:
    env = "/Users/chrisd/dev-projects/test-volume"

fname = env + "/app.log"


logging.basicConfig(
    level=logging.INFO, format="%(asctime)s %(message)s", filename=fname
)
logging.info(f"New run *****")
logging.info(f"Python Version: {sys.version}")
logging.info(f"Executable: {sys.executable}")
logging.info(f"Environment: {env}")
logging.info(f"Current user : {getpass.getuser()}")


print(f"Python version : {sys.version}")
print(f"Current user : {getpass.getuser()}")
print(f"Executable: {sys.executable}")
print(f"Environment: {env}")

print("hello world")
print("line 2")
print("line 3")
print("line 4")
print("line 5")


# pd.DataFrame('')

# df = pd.array['', '' ]
