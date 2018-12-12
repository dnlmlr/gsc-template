FROM ubuntu:18.04

ARG USERNAME=gsc
ENV USERNAME=$USERNAME

ARG UID=15335
ENV UID=$UID

# Set static constant paths
ENV SERVER_DIR /home/$USERNAME/server_files
ENV TEMP_DIR /home/$USERNAME/server_files/update_cache

RUN useradd -u $UID $USERNAME
RUN mkdir -p $SERVER_DIR && chown -R $USERNAME /home/$USERNAME

WORKDIR $SERVER_DIR

COPY preset_functions.sh /usr/bin/preset_functions.sh

COPY on_build.sh /tmp/on_build.sh
RUN bash source /usr/bin/preset_functions.sh && /tmp/on_build.sh root

# Copy and chmod run and update scripts
COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
COPY on_run.sh /usr/bin/on_run
COPY on_update.sh /usr/bin/on_update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
RUN chmod +x /usr/bin/on_run
RUN chmod +x /usr/bin/on_update

USER $USERNAME

RUN bash source /usr/bin/preset_functions.sh && /tmp/on_build.sh user

CMD ["run"]
