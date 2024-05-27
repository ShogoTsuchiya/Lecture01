FROM python:3.7.17-slim
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && mkdir django \
    && python -m pip install --upgrade pip
WORKDIR /django
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
COPY ./My_Weather_Webapp ./
RUN pip install -r requirements.txt
EXPOSE 8080
CMD python manage.py runserver 0.0.0.0:8080