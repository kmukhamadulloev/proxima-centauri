#!bin/bash

declare -a domains=("pgadmin.host")

if [ `whoami` = root ]; then
    echo "ERROR: Please do not run setup script as root";
    exit 1
fi

if ! openssl &> /dev/null; then
    echo "ERROR: Please install OpenSSL on your machine";
    exit 1
fi

for i in "${domains[@]}"; do
    IFS='.' read -ra domain <<< "$i"
    echo "PROCESS: Doing certificate for $i"
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./config/nginx/cert/${domain[0]}.key -out ./config/nginx/cert/${domain[0]}.crt -subj "/CN=$i"
    echo "COMPLETE: Done certificate for $i"
done

#penssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout example.key -out example.crt -subj "/CN=example.com"
