FROM alpine:3.18

LABEL version="3.0.1"
LABEL maintainer="Pendect Tech Team <tech@pendect.com>" \
      org.label-schema.vendor="Pendect GmbH" \
      com.github.actions.name="RSyncer Action" \
      com.github.actions.description="This action syncs files (probably) generated by a previous step in the workflow with a remote server." \
      com.github.actions.icon="truck" \
      com.github.actions.color="blue"

RUN apk add --no-cache --virtual .run-deps rsync=3.2.7-r4 openssh=9.3_p2-r1 && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
