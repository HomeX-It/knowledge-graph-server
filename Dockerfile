FROM us-docker.pkg.dev/hx-package-repository/docker-images/graph-server:v1.6.0

# Java Virtual Machine Arguments
ENV JAVA_OPTIONS=-Xmx15G

COPY data/* $DATA/

COPY configuration/* $CONFIGURATION/

WORKDIR $SCRIPTS
RUN bash import_data.sh kg_tdb2_dataset
RUN bash build_text_search.sh tdb2_configuration.ttl
RUN bash warm_up_fuseki.sh knowledge_graph/query

RUN rm -R $DATA