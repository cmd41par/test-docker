# Define the Docker image name
IMAGE_NAME=test-docker

# Detect the operating system
ifeq ($(OS),Windows_NT)
    PROJECT_PATH=c:/Users/cmd41/dev-projects/test-docker
    VOLUME_PATH=c:/Users/cmd41/dev-projects/test-volume
else
    PROJECT_PATH=/home/user/dev-projects/test-docker
    VOLUME_PATH=/home/user/dev-projects/test-volume
endif

# Target to build the Docker image
build_container:
	docker build -t $(IMAGE_NAME) .

# Run the container, start bash... Windows requires full path so starts with c:/
run_bash: 
	docker run --rm -it -v $(PROJECT_PATH):/app -v $(VOLUME_PATH):/test-volume -e ENV=prod -p 5678:5678 test-docker  bash
	
	DOCKER_RUN=docker run --gpus all -it -v C:\Users\cmd41\dev-projects\TennisDec7:/app -v C:\Users\cmd41\dev-projects\TennisDec7_data:/data -e RUN_ID=mv3 -p 5678:5678 --rm $(IMAGE_NAME)

run_debug:
	python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app.py

run_jupyter:
	docker run -it --rm -p 8888:8888 -v $(PROJECT_PATH):/app -v $(VOLUME_PATH):/test-volume -e ENV=prod test-docker jupyter notebook --ip=0.0.0.0 --no-browser --allow-root 