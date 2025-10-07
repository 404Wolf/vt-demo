FROM alpine:3.20

RUN apk add --no-cache \
  deno \
  ttyd \
  bash \
  coreutils \
  ncurses \
  shadow \
  unzip \
  curl \
  ca-certificates

RUN useradd -m -s /bin/bash appuser
USER appuser
WORKDIR /home/appuser

ENV PATH="/home/appuser/.deno/bin:${PATH}"

RUN deno install -grAf jsr:@valtown/vt

COPY src/entrypoint.sh /home/appuser/entrypoint.sh
COPY src/init.sh       /home/appuser/init.sh

EXPOSE 8080
ENTRYPOINT ["/home/appuser/entrypoint.sh"]
