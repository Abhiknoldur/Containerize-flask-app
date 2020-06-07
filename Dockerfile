FROM alpine:3.9

# install necessary packages
RUN set -x 										&&	\ 
	apk add --no-cache --virtual .build-deps 		\
	python 											\
	py-pip

# install flask
RUN pip install flask

# copy app.py from current directory to /opt
COPY ./app.py /opt/app.py

# export a port 5000
EXPOSE 5000

# set environment variable
ENV FLASK_APP app.py

# now instead of /, everything will start from /opt/
WORKDIR /opt/

# additional arguments for the entrypoint command
CMD ["run", "--host=0.0.0.0", "--port=5000"]

# since flask is installed inside usr/bin/flask, also WORKDIR is '/opt' instead of '/'
# therefore complete command to access flask will be '/usr/bin/flask' and not 'usr/bin/flask'
ENTRYPOINT ["/usr/bin/flask"]
