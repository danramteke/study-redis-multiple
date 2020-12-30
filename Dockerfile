FROM swift:5.3.1-focal as builder
WORKDIR /build
ADD ./Package.* ./
RUN swift package resolve
RUN mkdir -p Sources/App && touch Sources/App/empty.swift \
    && mkdir -p Sources/Run && touch Sources/Run/main.swift \
    && mkdir -p Tests/AppTests && touch Tests/AppTests/empty.swift \
    && touch Tests/LinuxMain.swift
RUN swift build -c release
ADD ./Sources ./Sources
RUN swift build -c release



FROM swift:5.3.1-focal-slim as base
RUN useradd --user-group --create-home --system --skel /dev/null --home-dir /app vapor
WORKDIR /app
COPY --from=builder --chown=vapor:vapor /build/.build/release /app
USER vapor:vapor
ENV REDIS_1_URL="enter redis 1 URL"
ENV REDIS_2_URL="enter redis 2 URL"



FROM base as web
ENV PORT 80
EXPOSE $PORT
CMD /app/Run serve --env production --hostname 0.0.0.0 -p $PORT
