FROM alpine:3.22 AS curl-builder
RUN apk add --no-cache curl

FROM grafana/loki:3.6.4 AS runner
COPY --from=curl-builder /usr/bin/curl /usr/bin/curl
COPY --from=curl-builder /lib/ld-musl-x86_64.so.1 /lib/
COPY --from=curl-builder /usr/lib/libcurl.so.4 /usr/lib/
COPY --from=curl-builder /usr/lib/libz.so.1 /usr/lib/
COPY --from=curl-builder /usr/lib/libcares.so.2 /usr/lib/
COPY --from=curl-builder /usr/lib/libnghttp2.so.14 /usr/lib/
COPY --from=curl-builder /usr/lib/libidn2.so.0 /usr/lib/
COPY --from=curl-builder /usr/lib/libpsl.so.5 /usr/lib/
COPY --from=curl-builder /usr/lib/libssl.so.3 /usr/lib/
COPY --from=curl-builder /usr/lib/libcrypto.so.3 /usr/lib/
COPY --from=curl-builder /usr/lib/libzstd.so.1 /usr/lib/
COPY --from=curl-builder /usr/lib/libbrotlidec.so.1 /usr/lib/
COPY --from=curl-builder /usr/lib/libunistring.so.5 /usr/lib/
COPY --from=curl-builder /usr/lib/libbrotlicommon.so.1 /usr/lib/
