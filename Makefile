# Define the Docker image name
IMAGE_NAME=test-docker

# Target to build the Docker image
build_container:
	docker build -t $(IMAGE_NAME) .

run_bash:
	docker run --rm -it -v /Users/chrisd/dev-projects/test-docker:/app -v /Users/chrisd/dev-projects/test-volume:/test-volume -e ENV=prod -p 5678:5678 test-docker  bash

run_debug:
	python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app.py

run_jupyter:
	docker run -it --rm -p 8888:8888 -v /Users/chrisd/dev-projects/test-docker:/app -v /Users/chrisd/dev-projects/test-volume:/test-volume -e ENV=prod test-docker jupyter notebook --ip=0.0.0.0 --no-browser --allow-root 