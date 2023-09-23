SHELL =/bin/bash
PYTHON = python3
FLASK_APP = app.py
IMAGE_NAME = pyapp-example

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
	docker rmi $(IMAGE_NAME)

# build, and run docker container
run_docker:
	docker build -t $(IMAGE_NAME) .
	docker run -it --rm -p 80:8000 $(IMAGE_NAME)
