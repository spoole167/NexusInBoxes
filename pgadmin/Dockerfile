FROM dpage/pgadmin4:7.8
ENV PGADMIN_DEFAULT_EMAIL=admin@admin.com
ENV PGADMIN_DEFAULT_PASSWORD=admin123
ENV PGADMIN_SERVER_JSON_FILE=/tmp/servers.json

COPY setup.sh /
ENTRYPOINT /setup.sh

# Following is exmple envs.
# Should be replaced with real values via the compose file

ENV SERVER_COUNT=1
ENV DB_1=Hello
ENV USER_1=Ducky
ENV PASS_1=DuckyMcDuck
