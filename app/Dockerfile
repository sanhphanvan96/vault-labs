FROM python:3.8-slim

WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt && pip install gunicorn

# Copy the Python script and files
COPY . .

# Define a non-root user for added security
RUN groupadd -r -g 1000 flask && useradd -r -u 1000 -g 1000 flask
RUN chown -R flask:flask /app
USER flask

EXPOSE 8000
CMD [ "gunicorn", "-w" , "4", "-b", "0.0.0.0", "app:app"]
