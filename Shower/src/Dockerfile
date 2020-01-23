FROM mcr.microsoft.com/mssql-tools

ADD VERSION .

WORKDIR /opt/mssql-tools

COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]