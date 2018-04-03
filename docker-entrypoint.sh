#!/bin/sh

export PATH="/opt/confd/bin/:$PATH"

mkdir -p /etc/confd/conf.d
mkdir -p /etc/confd/templates

cp /code/confd/template.toml /etc/confd/conf.d/api.toml
cp /code/confd/template.conf.tmpl /etc/confd/templates/template.conf.tmpl
cp /code/confd/confd.toml /etc/confd/confd.toml

echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
echo "https://ssm.$AWS_REGION.amazonaws.com"

confd --onetime -node "https://ssm.$AWS_REGION.amazonaws.com"

python app/server.py