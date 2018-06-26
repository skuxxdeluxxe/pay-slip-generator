Pay Slip Generator
======

This solution will deploy two containers on your local machine to run the pay slip generator application. The pay slip generator will generate a pay slip based on the following details:

* First Name
* Last Name
* Annual Income
* Super Annuation Rate
* Payment Period

## Assumptions

* Super Annuation Rate provided as an integer string with no '%' sign i.e 9, not 9% or 0.09.
* Annual Income provided with no commas to denonte thousands i.e 60500, not 60,500.
* Payment Period to be a string entered and used as verbatim. No figuring out start and end dates for months.

## Prerequisites

* Ruby 2.0.0
* Bundler 1.15.4
* Nodejs 8.10
* Python 2.7
* Docker 18.03.1-ce

## Start the Application (FAST)

1. Run the start-app script
    ```
    $ ./start-app.sh
    ```
2. Open your favourite browser at http://localhost:3000

## Start the Application (SLOW)

1. Build and deploy the frontend
    ```
    $ cd frontend
    $ npm install
    $ npm run build
    $ docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-frontend .
    $ docker run -d -p 3000:80 skuxxdeluxxe117/pay-slip-generator-frontend
    ```
2. Build and deploy the backend
    ```
    $ cd backend
    $ gem build pay-slip-generator.gemspec
    $ docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-logic .
    $ docker run -d -p 5000:5000 skuxxdeluxxe117/pay-slip-generator-logic
    ```
3. Open your favourite browser at http://localhost:3000

## Tests

Tests for the ruby gem handling the payslip generation can be run with the following:

    $ cd backend
    $ bundle exec rake