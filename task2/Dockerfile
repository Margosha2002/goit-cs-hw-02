FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential
RUN pip3 install --upgrade pip

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

COPY . .

CMD uvicorn main:app --host 0.0.0.0 --port 8000