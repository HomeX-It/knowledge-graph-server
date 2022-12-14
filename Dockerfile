FROM us-docker.pkg.dev/hx-package-repository/docker-images/graph-server:v1.4.5

# Java Virtual Machine Arguments
ENV JAVA_OPTIONS=-Xmx20G

COPY data/* $DATA/

COPY configuration/* $CONFIGURATION/

WORKDIR $SCRIPTS
RUN bash import_data.sh kg_tdb2_dataset
RUN bash build_text_search.sh tdb2_configuration.ttl

RUN rm -R $DATA