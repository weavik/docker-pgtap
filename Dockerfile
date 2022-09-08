FROM postgis/postgis:12-3.2

WORKDIR /opt

COPY pgtap-1.2.0 ./pgtap-1.2.0/

RUN apt-get update && apt-get install make patch -y && rm -rf /var/lib/apt/lists/*

RUN cd ./pgtap-1.2.0/ && make && make install

COPY create_extension.sql /docker-entrypoint-initdb.d/
