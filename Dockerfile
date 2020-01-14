FROM alpine:latest AS downloader

RUN apk add --no-cache curl \
    && curl https://www.keyshot.com/download/347154/ -o /root/luxion_flexlm.zip \
    && mkdir /root/luxion_flexlm \
    && unzip /root/luxion_flexlm.zip -d /root/

# Pull base image.
FROM ubuntu:18.04

# Add files.
COPY --from=downloader /root/luxion_flexlm/ /usr/bin/luxion_flexlm
COPY supervisord.sh /usr/bin/supervisord.sh

# Install supervisord and libc6-compat for lib64 libraries required by service
RUN apt update && apt install -y supervisor \
    && ln -s /lib64/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 \
    && chmod +x /usr/bin/supervisord.sh \
    && mkdir -p /var/luxion_flexlm/

COPY luxion_flexlm.conf /etc/supervisor/conf.d/luxion_flexlm.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

EXPOSE 27000

VOLUME [ "/var/luxion_flexlm" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "/usr/bin/luxion_flexlm/lmstat", "-a" ]
# Define default command.
ENTRYPOINT ["/usr/bin/supervisord.sh"]
# ENTRYPOINT [ "/bin/bash" ]
