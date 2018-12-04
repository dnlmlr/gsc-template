FROM egeeio/steamcmd

ARG uid
RUN usermod -u ${uid} gsc
USER gsc

# Set static constant paths
ENV SERVER_DIR /home/gsc/server_files
ENV TEMP_DIR /home/gsc/server_files/update_cache

RUN mkdir -p ${SERVER_DIR}

WORKDIR /home/gsc/server_files

# The basename of the file that will be executed to start the server
ENV SERVER_EXECUTABLE change_me

# Copy and chmod run and update scripts
COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update

CMD ["run"]
