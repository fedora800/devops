FROM python:3.11-alpine

# Set up environment variables for Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code
COPY . .

# Expose the port your application will run on
EXPOSE 5000

# Specify the command to run on container start
CMD ["python", "app.py"]

# $ sudo docker image build --file Dockerfile --tag basic-flask-app:v1 .
# $ sudo docker container run -itd --publish 80:5000 basic-flask-app:v1     
# $ curl localhost:80
# $ curl <PUBLIC_IP>:80      # running this from another host will also work. make local firewall allow this port first.

