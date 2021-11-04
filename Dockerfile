FROM nginx


# this line of code will config the working dir of the container to be "/scr"
# WORKDIR /src

# this line of code will copy the modified nginx.conf file to the nginx
# container
# the modified file will config the nginx container to perform reverse proxy
# task on behave of the app
COPY ./nginx.conf /etc/nginx/


# this line of code will expose port 80 and 443 of the nginx container to the 
# to the host machine
# this will allow the nginx container to respond to both http and https request
# from the host machine
EXPOSE 80 443

# this line of code sets the running process of the containers that will be made from this image.
# it will run the flask app and make it response to traffic on port 8000 coming on its interface.
# it will be the equivalant of running the following in a the CLI:
    # python -m flask run --port-8000 --host=0.0.0.0
    # this was needed because the code for the flask app did not contain the "app.run()" method at the
    # ...end of the file
# ENTRYPOINT ["python", "-m", "flask", "run", "--port=8000", "--host=0.0.0.0"]