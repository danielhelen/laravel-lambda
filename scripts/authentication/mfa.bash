#!/bin/sh

if [ -z "$MFA_ID" ]; then
  echo "MFA_ID is not set. Aborting."
  exit 1
fi

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

echo "Enter MFA Code:"
read MFA_CODE

GET_SESSION_TOKEN_RESPONSE=$(aws sts get-session-token --serial-number $MFA_ID --token-code $MFA_CODE)

AWS_ACCESS_KEY_ID=$(echo "$GET_SESSION_TOKEN_RESPONSE" | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo "$GET_SESSION_TOKEN_RESPONSE" | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo "$GET_SESSION_TOKEN_RESPONSE" | jq -r '.Credentials.SessionToken')

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
