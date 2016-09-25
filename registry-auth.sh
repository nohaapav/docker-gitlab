#!/bin/bash

echo "Enter username:"
read user
echo "Enter password:"
read passwd

mkdir auth
docker run --entrypoint htpasswd registry:2 -Bbn $user $passwd  > auth/htpasswd
