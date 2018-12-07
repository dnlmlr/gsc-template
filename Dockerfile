FROM egeeio/steamcmd

ARG uid
RUN usermod -u ${uid} gsc

# Set static constant paths
ENV SERVER_DIR /home/gsc/server_files
ENV TEMP_DIR /home/gsc/server_files/update_cache

RUN mkdir -p ${SERVER_DIR}
RUN chown gsc ${SERVER_DIR}

WORKDIR /home/gsc/server_files

COPY funcs.sh /usr/bin/funcs.sh
RUN bash -c 'source /usr/bin/funcs.sh && on_build'

# Copy and chmod run and update scripts
COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update

RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update

USER gsc

CMD ["run"]
