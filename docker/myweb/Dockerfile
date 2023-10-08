# Use the official image as a parent image.
FROM python:3.9.10

ARG user=tong

# Copy the file from your host to your current location.
# COPY package.json .

# Run the command inside your image filesystem.
RUN apt-get update && apt-get install -y sudo \
    && useradd --create-home --no-log-init --shell /bin/bash ${user} \
    && chown -R ${user}:${user} /home/${user}/ \
    && adduser ${user} sudo \
    && echo "${user}:1" | chpasswd \
    && pip install Django==4.0.2 -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install django-markdownx -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install django-mdeditor -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install django-xadmin -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install django-bootstrap3 -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install uwsgi -i https://pypi.tuna.tsinghua.edu.cn/simple
    
USER ${user}
# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Set the working directory.
WORKDIR /myweb

ENV MYWEB_IS_DEBUG=0
# Run the specified command within the container.
CMD [ "sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py collectstatic --no-input && uwsgi --chdir=./ --wsgi-file=./myweb/wsgi.py --static-map=/static=./statics --ini uwsgi/uwsgi.ini"]

# Copy the rest of your app's source code from your host to your image filesystem.
# COPY . .