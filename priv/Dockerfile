# Build intermediate image to build relase
FROM bitwalker/alpine-elixir-phoenix:latest as builder

ARG name=phoenix
ENV name=${name} MIX_ENV=prod

ADD . .

# If there's assets, install and build them
RUN if [ -d assets ]; then \
      mix deps.get && cd assets && \
      if [ -f package-lock.json ]; then npm install && npm run deploy; fi && \
      if [ -f yarn.lock ]; then apk add --update --no-cache yarn && yarn install && yarn deploy; fi && \
      cd .. && mix phx.digest; \
    fi

# Build the release
RUN mix release

# Build the actual release image
FROM bitwalker/alpine-erlang:latest

ARG name

ENV name=${name} PORT=4000 MIX_ENV=prod SHELL=/bin/sh REPLACE_OS_VARS=true
EXPOSE 4000
CMD /opt/app/bin/$name start

COPY --from=builder /opt/app/_build/prod/rel/$name .
