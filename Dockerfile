FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7-alpine3.8

COPY . /app
COPY requirements.txt /requirements.txt

RUN apk add g++ 
RUN pip3 install -r requirements.txt

WORKDIR /

CMD ["gunicorn", "-c", "app/conf/gunicornconf.py" ,"--bind", "0.0.0.0:80" , "main:app"]
