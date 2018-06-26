#!/bin/bash

cd frontend
npm install
npm run build
docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-frontend .
docker run -d -p 3000:80 skuxxdeluxxe117/pay-slip-generator-frontend

cd ../

cd backend
gem build pay-slip-generator.gemspec
docker build -f Dockerfile -t skuxxdeluxxe117/pay-slip-generator-logic .
docker run -d -p 5000:5000 skuxxdeluxxe117/pay-slip-generator-logic

echo "DEPLOY SUCCEEDED"