FROM radiantone/fid:7.3.16

# Provide a non-root user to run the process.
RUN groupadd --gid 1000 radiantone && \
    useradd --uid 1000 --gid 1000 -G 0 \
      --home-dir /opt/radiantone --no-create-home \
      radiantone

# Copy the resource files
COPY test.ldif /resources/test.ldif
COPY myexport.zip /migrations/export.zip
COPY configure_fid.sh /opt/radiantone/scripts/configure_fid.h
COPY docker-entrypoint.sh /opt/radiantone/docker-entrypoint.sh
RUN chmod +x /opt/radiantone/docker-entrypoint.sh

# Change the ownership
RUN chown -R radiantone:radiantone /opt/radiantone
RUN chown -R radiantone:radiantone /migrations
RUN chown -R radiantone:radiantone /resources

# Change the User
USER radiantone
#RUN chmod -R g=u /opt/radiantone

# Set the wrking directory
WORKDIR /opt/radiantone

# Override the entrypoint
ENTRYPOINT ["/opt/radiantone/docker-entrypoint.sh"]

