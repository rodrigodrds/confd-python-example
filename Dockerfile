FROM python3.6-ops-base:latest

# MAINTAINER Rodrigo Dias "rodrigo.dias@pagar.me"
# RUN apk add --no-cache gcc g++ python3-dev
# RUN apk update && \
#     apk add ca-certificates wget
# RUN pip install --upgrade pip

ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt
RUN apk del build-dependencies

RUN chmod +x docker-entrypoint.sh