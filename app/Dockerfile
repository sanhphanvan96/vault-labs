FROM python:3.8-slim

WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt && pip install gunicorn

# Copy the Python script and requirements file into the container
COPY . .

# Define a non-root user for added security
RUN groupadd -r flaskuser && useradd -r -g flaskuser flaskuser
RUN chown -R flaskuser:flaskuser /app
USER flaskuser

EXPOSE 8000
CMD [ "gunicorn", "-w" , "4", "-b", "0.0.0.0", "app:app"]
