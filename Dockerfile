FROM python:3.8

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install pip requirements
ADD requirements.txt .
RUN python -m pip install -r requirements.txt
RUN apt-get -y update && \
        apt-get -y install \
        python-gdal \
        python-geoip \
        rpl\
        libsqlite3-mod-spatialite
WORKDIR /app
ADD . /app

CMD ["python", "manage.py","runserver"]
