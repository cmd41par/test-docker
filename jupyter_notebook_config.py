# filepath: /Users/chrisd/dev-projects/test-docker/jupyter_notebook_config.py
from traitlets.config import get_config

c = get_config()
c.NotebookApp.token = ""
c.NotebookApp.password = ""
c.NotebookApp.ip = "0.0.0.0"
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True
