FROM radiantone/fid:7.4.4

# Provide a non-root user to run the process.
RUN groupadd --gid 1000 radiantone && \
    useradd --uid 1000 --gid 1000 \
      --home-dir /opt/radiantone --no-create-home \
      radiantone

# Change the ownership
RUN chown -R radiantone:radiantone /opt/radiantone

# Change the User
USER radiantone
#RUN chmod -R g=u /opt/radiantone

# Set the wrking directory
WORKDIR /opt/radiantone

# Override the entrypoint
ENTRYPOINT ["/opt/radiantone/run.sh"]
CMD ["log"]
