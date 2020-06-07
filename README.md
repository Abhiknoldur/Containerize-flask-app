# Containerize Flask App

Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries. It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. 

Now you can run flask in containerize environment, just use the Dockerfile in the repo using command

> docker build -t flask:v1 .


To run this app:

> docker run -p 5000:5000 flask:v1
