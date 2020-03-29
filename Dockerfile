# import and apply an existing docker image.
# in this case it's an official image including the latest python 3
FROM python:3

# make a directory in your container and set the working directory there
RUN mkdir /app
WORKDIR /app

# copy the pip install requirements to the container's /app directory, then install them
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# now set the working directory to /src
# the purpose of this is to have paths in docker_test.py be relative to the /src directory
WORKDIR src

# run the python script. i used the full path here but the relative path will work too
CMD [ "python", "docker_test.py" ]
