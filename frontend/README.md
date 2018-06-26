Pay Slip Generator Frontend
======

This will deploy the frontend container for the pay slip generator application

## Deploy the container

    $ npm install
    $ npm run build
    $ docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-frontend .
    $ docker run -d -p 3000:80 skuxxdeluxxe117/pay-slip-generator-frontend

## Run application locally

    $ npm install
    $ npm start

## Usage

Visit http://localhost:3000 to see the frontend
