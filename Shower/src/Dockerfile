FROM mcr.microsoft.com/mssql-tools

ADD VERSION .

COPY entrypoint.sh ./opt/mssql-tools/entrypoint.sh

RUN chmod +x /opt/mssql-tools/entrypoint.sh

ENTRYPOINT ["./opt/mssql-tools/entrypoint.sh"]