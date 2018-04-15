# Build intermediate image to build relase
FROM bitwalker/alpine-elixir-phoenix:latest as builder

ARG name
ENV name=${name} \
    MIX_ENV=prod

ADD . .

# If there's assets, install yarn and build them
RUN if [ -d assets ]; then \
      apk add --update --no-cache yarn && \
      mix deps.get && \
      cd assets && yarn install && yarn build && cd .. && \
      mix phx.digest; \
    fi

# Build the release
RUN mix release --env=$MIX_ENV

# Build the actual release image
FROM bitwalker/alpine-erlang:latest

ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true SHELL=/bin/sh
EXPOSE 4000
ENTRYPOINT /opt/app/bin/$name
CMD foreground

COPY --from=builder /opt/app/_build/prod/rel/${name} .
