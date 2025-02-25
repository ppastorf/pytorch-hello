FROM python:3.14
COPY . /app
WORKDIR /app
RUN python -m pip install -r requirements.txt
CMD [ "python3", "main.py"]