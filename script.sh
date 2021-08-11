#!/bin/bash

echo 'Generating client.crt and client.key...'
openssl req \
       -newkey rsa:2048 -nodes -keyout client.key \
       -x509 -days 365 -out client.crt

echo 'What is the URI of the database?'
read $uri

echo 'What port should be accessed at {$uri} ?'
read $port

echo "URI: $uri";
echo "Port: $port";

echo "Fetching certificate, saving to server_key.crt ..."

python get_server_cert.py $uri:$port > server_key.crt
