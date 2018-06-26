FROM beevelop/nodejs-python-ruby:latest
RUN apt-get update -y
RUN apt-get install -y build-essential
COPY flask-app /app
COPY pay-slip-generator-0.1.0.gem /app
WORKDIR /app
RUN gem install bundler
RUN gem install activesupport
RUN gem install pay-slip-generator-0.1.0.gem
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]