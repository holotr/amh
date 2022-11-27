FROM ubuntu:22.04

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install wget dropbear -y \
    && export CV=[CN] DV=N \
    && wget http://dl.amh.sh/amh.sh \
    && sed -i 's/DefaultPassword=`.*/DefaultPassword="admin"/' amh.sh \
    && sed -i 's/read.*/selected="y"/' amh.sh \
    && chmod +x /entrypoint.sh \
    && bash amh.sh 

CMD /entrypoint.sh

EXPOSE 8888 9999 22 21 20 443 80
