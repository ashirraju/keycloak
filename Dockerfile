FROM quay.io/keycloak/keycloak:latest AS builder

# Copy custom themes into the Keycloak build environment
COPY themes /opt/keycloak/themes

# Set build-time options
ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Pre-build Keycloak for optimized startup performance
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Production JVM memory and GC tuning (allocating minimum 256MB heap, 768MB max heap)
ENV JAVA_OPTS_APPEND="-Xms256m -Xmx768m -XX:+UseG1GC -XX:MaxMetaspaceSize=192m -XX:+ExitOnOutOfMemoryError"

# Production runtime defaults
ENV KC_DB=postgres
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY_HEADERS=xforwarded
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]



