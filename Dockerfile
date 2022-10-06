FROM us-docker.pkg.dev/hx-package-repository/docker-images/graph-server:v1.2.0

COPY data/* $DATA/

COPY configuration/* $CONFIGURATION/

WORKDIR $SCRIPTS
RUN bash import_data.sh kg_tdb2_dataset
RUN bash build_text_search.sh configuration.ttl