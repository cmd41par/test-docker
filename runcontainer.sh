docker run -it --rm --name test-docker -v /Users/-v /Users/chrisd/dev-projects/test-volume:/data test-docker bash

# run interactive 
https://python.plainenglish.io/python-debugging-running-or-dockerized-application-807eaee009cc

docker run --rm -it -p 5678:5678 test-docker  bash

docker build -t test-docker .

python -m debugpy --listen 0.0.0.0:5678 --pid nnnn

 /usr/bin/env /usr/local/bin/python3 
 
 /Users/chrisd/.vscode/extensions/ms-azuretools.vscode-docker-1.25.1/resources/python/launcher.py 53389 -- app.py docker testdocker-dev


https://www.youtube.com/watch?v=ywfsLKRLmf4
docker build -t test-docker .
docker run --rm -it -v /Users/chrisd/dev-projects/test-docker:/app -v /Users/chrisd/dev-projects/test-volume:/test-volume -e ENV=prod -p 5678:5678 test-docker  bash
python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app.py
select Python Remote attach

# setup jupyter config - https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html
jupyter server --generate-config
pwd: Cinders1


# run jupyter 
docker run -it --rm -p 8888:8888 -v /Users/chrisd/dev-projects/test-docker:/app -v /Users/chrisd/dev-projects/test-volume:/test-volume -e ENV=prod test-docker jupyter notebook --ip=0.0.0.0 --no-browser --allow-root 
# find the url and paste it into the select kernel for VSCode runtime... 

