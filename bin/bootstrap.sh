#!/bin/bash
APP_ID=20da1794-b47e-41c4-98f5-3b40523605e9
APP_NAME=spotbuy
bootstrap $APP_ID

echo "Adding secrets for the application use"
./bin/vault-writeSecret.sh $APP_ID
