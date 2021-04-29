FROM python:3.7-slim as production

ENV PYTHONUNBUFFERED=1
WORKDIR /app/

#RUN apt-get update && \
    #apt-get install -y \
    #bash \
    #build-essentials \
    #gcc \
    #libffi-dev \
    #musl-dev \
    #openssl \
    #postgresql \
    #libpq-dev

COPY requirements/prod.txt ./requirements/prod.txt
RUN pip install -r ./requirements/prod.txt

COPY manage.py ./manage.py
COPY hackershack_website ./hackershack_website

EXPOSE 8000


#FROM production as development
#RUN pip install -r ./requirements/dev.txt

COPY . .