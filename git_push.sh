#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

(
cd ecom-common
git push origin main
)

(
cd ecom-security
git push origin main
)

(
cd ecom-rest-client
git push origin main
)

(
cd product-service
git push origin main
)

(
cd customer-service
git push origin main
)

(
cd order-service
git push origin main
)

(
cd inventory-service
git push origin main
)

(
cd notification-service
git push origin main
)

(
cd kyc-service
git push origin main
)

(
cd risk-score-service
git push origin main
)

(
cd fraud-detection-service
git push origin main
)