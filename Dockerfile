FROM docker:26.1.0

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py3-pip coreutils bash \
  && rm -rf /var/cache/apk/* \
  && pip3 install  --break-system-packages pyyaml==5.3.1 \
  && pip3 install  --break-system-packages -U awscli \
  && apk --purge -v del py3-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
