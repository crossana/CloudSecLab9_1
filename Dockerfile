# Chooses our base OS with python 3.11 installed 
FROM python:3.11  


# Set the working directory inside the container 
WORKDIR /app 
 
# Copy the current directory contents (the web app) into the container at /app 
COPY . ./ 

# Install the required dependencies using requirements.txt 
RUN pip install -r requirements.txt 

# Make port 8080 available to the world outside this container 
EXPOSE 8080

# Run app.py when the container launches 
#CMD python app.py 
