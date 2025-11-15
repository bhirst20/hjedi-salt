!/bin/bash

files=("cert.pem" "chain.pem" "fullchain.pem" "privkey.pem")

for file in "${files[@]}"; do
    if [ ! -f /etc/letsencrypt/archive/hjedi.net/$file ]; then
        cp /etc/letsencrypt/live/hjedi.net/$file /etc/letsencrypt/archive/hjedi.net/$file
    fi
    check=$(diff /etc/letsencrypt/live/hjedi.net/$file /etc/letsencrypt/archive/hjedi.net/$file | wc -l)

    if [ $check -ne 0 ]; then
        cp /etc/letsencrypt/live/hjedi.net/$file /etc/letsencrypt/archive/hjedi.net/$file
        curl -d "Cert $file updated on Lothlorien" ntfy.sh/svjgQ5oxGZJoizCu
    fi
done
