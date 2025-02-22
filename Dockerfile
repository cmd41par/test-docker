# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.12-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install make and other dependencies
RUN apt-get update && apt-get install -y make

# Install pip requirements
#COPY requirements.txt .
#RUN python -m pip install -r requirements.txt
RUN python -m pip install pandas
RUN python -m pip install debugpy
RUN pip install pytest

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "app.py"]
# Run the Jupyter Notebook configuration script and then start the Jupyter server
# CMD python -m /app/jupyter_notebook_config.py && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root

# docker build cmd -> docker build -t test-docker .