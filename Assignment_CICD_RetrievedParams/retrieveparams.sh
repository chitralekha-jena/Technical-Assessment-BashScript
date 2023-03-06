#!/bin/bash

# set the URL for the API endpoint
auth_url="https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth"

# make a curl request to the auth API endpoint and store the response in a variable
response=$(curl -s $auth_url)

# check if curl command returned an error
if [ $? -ne 0 ]; then
  echo "Error: Failed to retrieve authentication token"
  exit 1
fi

# extract token from the response using jq
token=$(echo $response | jq -r '.token')

# set the URL for the API endpoint
param_url="https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters"

# make a curl request to the API endpoint, passing the token as an HTTP GET parameter
response=$(curl -s "${param_url}?TOKEN=${token}")

# check if curl command returned an error
if [ $? -ne 0 ]; then
  echo "Error: Failed to retrieve parameter values"
  exit 1
fi

# extract PARAMETER1 and PARAMETER2 from the response using jq
parameter1=$(echo $response | jq -r '.PARAMETER1')
parameter2=$(echo $response | jq -r '.PARAMETER2')

echo "Paramaters retrieved from external API"
# output PARAMETER1 and PARAMETER2 to the console
echo "PARAMETER1: $parameter1"
echo "PARAMETER2: $parameter2"
