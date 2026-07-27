# Keycloak Custom Theme

Place theme files under `themes/<theme-name>`.

Example:

- `themes/custom-theme/theme.properties`
- `themes/custom-theme/login/login.ftl`
- `themes/custom-theme/resources/css/styles.css`

The `docker-compose.yml` file mounts `./themes` into the container so you can edit themes live.
