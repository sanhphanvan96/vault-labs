SHELL =/bin/bash
PYTHON = python3
FLASK_APP = app.py
IMAGE_TAG = pyapp-example:0.3
IMAGE_TAG_REMOTE = sphanlabs/$(IMAGE_TAG)

default: build_docker run_docker

# Install dependencies
setup:
	$(PYTHON) -m venv venv
	. venv/bin/activate; pip install -r requirements.txt

# Run the Flask app
run:
	. venv/bin/activate; flask run

# Clean up the virtual environment, compiled files, docker image
clean:
	rm -rf venv __pycache__
	docker rmi $(IMAGE_TAG)

# build docker image
docker_build:
	docker build -t $(IMAGE_TAG) .

# build, and run docker container
docker_run:
	docker run -it --rm -p 80:8000 $(IMAGE_TAG)

# publish to docker register
docker_push:
	docker tag $(IMAGE_TAG) $(IMAGE_TAG_REMOTE)
	docker push $(IMAGE_TAG_REMOTE)
