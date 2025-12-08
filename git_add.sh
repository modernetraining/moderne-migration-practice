#!/bin/bash

# Exit immediately if a command exits with a non-zero status
# set -e

(
cd ecom-common
git add .
git commit -m "$1"
)

(
echo "Building ecom-security..."
cd ecom-security
git add .
git commit -m "$1"
)

(
echo "Building ecom-rest-client..."
cd ecom-rest-client
git add .
git commit -m "$1"
)

(
echo "Building product-service..."
cd product-service
git add .
git commit -m "$1"
)

(
echo "Building customer-service..."
cd customer-service
git add .
git commit -m "$1"
)

(
echo "Building order-service..."
cd order-service
git add .
git commit -m "$1"
)

(
echo "Building inventory-service..."
cd inventory-service
git add .
git commit -m "$1"
)

(
echo "Building notification-service..."
cd notification-service
git add .
git commit -m "$1"
)

(
echo "Building kyc-service..."
cd kyc-service
git add .
git commit -m "$1"
)

(
echo "Building risk-score-service..."
cd risk-score-service
git add .
git commit -m "$1"
)

(
echo "Building fraud-detection-service..."
cd fraud-detection-service
git add .
git commit -m "$1"
)