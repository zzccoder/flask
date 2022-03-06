FROM python:3.6
WORKDIR .
COPY . .
RUN pip install --upgrade pip && pip install -i https://mirrors.aliyun.com/pypi/simple -r requirements.txt
EXPOSE 5000

CMD ["pip", "install", "-U", "Flask"]
#CMD ["flask","run"]
