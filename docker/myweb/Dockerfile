# Use the official image as a parent image.
FROM python:3.9.10

ARG user=tong

# Set the working directory.
WORKDIR /home/${user}/

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
    && pip install django-bootstrap3 -i https://pypi.tuna.tsinghua.edu.cn/simple
    
USER ${user}
# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Run the specified command within the container.
# CMD [ "npm", "start" ]

# Copy the rest of your app's source code from your host to your image filesystem.
# COPY . .