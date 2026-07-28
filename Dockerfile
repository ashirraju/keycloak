FROM quay.io/keycloak/keycloak:latest AS builder

# Copy custom themes into the Keycloak build environment
COPY themes /opt/keycloak/themes

# Set build-time options
ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=true

# Pre-build Keycloak for optimized startup performance
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Tune JVM heap memory allocation (fit within Northflank free tier / low-RAM limits)
ENV JAVA_OPTS_APPEND="-Xms128m -Xmx400m"

# Production runtime defaults
ENV KC_DB=postgres
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY_HEADERS=xforwarded
ENV KC_HEALTH_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]


