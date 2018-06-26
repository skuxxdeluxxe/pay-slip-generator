Pay Slip Generator Backend
======

This will deploy the backend container for the pay slip generator application

## Deploy the container

    $ bundle install
    $ gem build pay-slip-generator.gemspec
    $ docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-logic .
    $ docker run -d -p 5000:5000 skuxxdeluxxe117/pay-slip-generator-logic

## Run application locally

    $ bundle install
    $ gem build pay-slip-generator.gemspec
    $ gem install pay-slip-generator-0.1.0.gem
    $ cd flask-app
    $ pip install -r requirements.txt
    $ pip install -U flask-cors
    $ python -m textblob.download_corpora
    $ python app.py

## Usage

Run the following curl command:

    $ curl -d '{"firstName":"value1", "lastName":"value2", "annualSalary":"60050", "superRate":"9", "paymentPeriod":"30 March"}' -H "Content-Type: application/json" -X POST http://localhost:5000/generate

Expected output:

    {"error":"","paySlip":"value1 value2, 30 March, 5004, 922, 4082, 450\n"}

## Tests

Run the following rake task:

    $ bundle exec rake
