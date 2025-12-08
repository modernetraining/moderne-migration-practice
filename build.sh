#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Building ecom-common..."
cd example-ecom-common && mvn clean install && cd ..

echo "Building ecom-security..."
cd example-ecom-security && mvn clean install && cd ..

echo "Building ecom-rest-client..."
cd example-ecom-rest-client && mvn clean install && cd ..

echo "Building product-service..."
cd example-ecom-product-service && mvn clean install && cd ..

echo "Building customer-service..."
cd example-ecom-customer-service && mvn clean install && cd ..

echo "Building order-service..."
cd example-ecom-order-service && mvn clean install && cd ..

echo "Building inventory-service..."
cd example-ecom-inventory-service && mvn clean install && cd ..

echo "Building notification-service..."
cd example-ecom-notification-service && mvn clean install && cd ..

echo "Building kyc-service..."
cd example-ecom-kyc-service && mvn clean install && cd ..

echo "Building risk-score-service..."
cd example-ecom-risk-score-service && mvn clean install && cd ..

echo "Building fraud-detection-service..."
cd example-ecom-fraud-detection-service && mvn clean install && cd ..

echo "Rebuilding Docker containers..."
docker-compose build

echo "Build complete!"
