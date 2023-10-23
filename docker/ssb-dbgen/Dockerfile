### Stage 0 - build
FROM gcc
COPY ssb-dbgen /src
WORKDIR /src
RUN make clean
RUN make

### Stage 1 - run
FROM gcc
COPY --from=0 /src/dbgen /bin
COPY --from=0 /src/dists.dss /bin/dists.dss
COPY ssb-dbgen.sh /bin
WORKDIR /data

# Generate some data - 1 file, all tables (dimension and facts)
CMD ["/bin/ssb-dbgen.sh", "-s", "1", "-T", "a" ]
