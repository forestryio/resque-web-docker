FROM ruby:2.5-alpine

RUN apk add --no-cache --update build-base && \
    gem install --no-ri --no-rdoc resque-web resque-scheduler-web && \
    apk del build-base && \
    rm -rf /usr/local/bundle/cache

EXPOSE 5678
ENTRYPOINT ["resque-web", "-FL"]
CMD ["-h"]