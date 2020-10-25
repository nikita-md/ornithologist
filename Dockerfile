FROM elixir:1.10-alpine

RUN apk --update --upgrade --no-cache add git bash build-base postgresql-dev inotify-tools erlang-dev erlang-parsetools ca-certificates nodejs

ENV YARN_VERSION 1.22.5
ADD https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v${YARN_VERSION}.tar.gz /opt/yarn.tar.gz
RUN mkdir -p /opt && \
    tar -xzf /opt/yarn.tar.gz -C /opt/ && \
    ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn && \
    rm /opt/yarn.tar.gz

RUN mix local.hex --force && mix local.rebar --force && mix hex.info
RUN mix archive.install hex phx_new 1.5.0 --force

ENV APP_NAME web

COPY . /$APP_NAME

EXPOSE 4000

WORKDIR /$APP_NAME
