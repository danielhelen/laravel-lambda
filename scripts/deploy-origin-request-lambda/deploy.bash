#!/usr/bin/env bash

echo "Enter Lambda Function Name:"
read FUNCTION_NAME

source ../../.env
source ../authentication/mfa.bash
cd ../../origin-request-lambda
zip -9 -r package.zip * -i "index.js"
aws lambda update-function-code --function-name $FUNCTION_NAME --zip-file fileb://package.zip --region us-east-1
aws lambda wait function-updated --function-name $FUNCTION_NAME --region us-east-1
NEW_VERSION=$(aws lambda publish-version --function-name $FUNCTION_NAME --query 'Version' --output text --region us-east-1)
echo "New version: ${NEW_VERSION}"
