# Define the Docker image name
IMAGE_NAME=test-docker

# Detect the operating system
ifeq ($(OS),Windows_NT)
    PROJECT_PATH=c:/Users/cmd41/dev-projects/test-docker
    VOLUME_PATH=c:/var/data
else
    PROJECT_PATH=/home/user/dev-projects/test-docker
    VOLUME_PATH=/home/user/dev-projects/test-volume
endif

# Target to show wsl version
wsl_version:
	wsl --version

# Target to show container os
container_os:
	uname -a

# Target to build the Docker image
build_container:
	docker build -t $(IMAGE_NAME) .

# Run the container, start bash... Windows requires full path so starts with c:/
run_bash: 
	docker run --rm -it -v $(PROJECT_PATH):/app -v $(VOLUME_PATH):/test-volume -e ENV=prod -p 5678:5678 test-docker  bash
	
run_debug:
	python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app.py

# Target to run pytest in debug mode
test_debug:
	python -m debugpy --listen 0.0.0.0:5678 --wait-for-client -m pytest test_app.py

# Target to run pytest
run_tests:
	pytest


#run_jupyter: ** does work yet
#	docker run -it --rm -p 8888:8888 -v $(PROJECT_PATH):/app -v $(VOLUME_PATH):/test-volume -e ENV=prod test-docker jupyter notebook --ip=0.0.0.0 --no-browser --allow-root 