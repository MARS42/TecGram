FROM python:3.8.2
WORKDIR /code
COPY . /code  
RUN pip install -r requirements.txt
 
ENV PORT 5000
CMD [ "python", "main.py" ]
