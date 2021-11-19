FROM alpine:3.12

RUN apk --no-cache --update add bash git \
    && rm -rf /var/cache/apk/*

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN wget -O - -q "$(wget -q https://api.github.com/repos/aquasecurity/cfsec/releases/latest -O - | grep -o -E "https://.+?cfsec-linux-amd64" | head -n1)" > cfsec \
    && install cfsec /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
