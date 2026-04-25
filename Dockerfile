# This Dockerfile helps us to build a static version of wordpress that
# won't auto-update itself. Why? Well it's not very aligned with the
# way versioning is handling in Kubernetes deployments, and it also
# makes the assignment confusing if things auto-fix themselves ;)
ARG WORDPRESS_VERSION
ARG CI_DEPENDENCY_PROXY_DIRECT_GROUP_IMAGE_PREFIX
FROM ${CI_DEPENDENCY_PROXY_DIRECT_GROUP_IMAGE_PREFIX}/wordpress:${WORDPRESS_VERSION}
WORKDIR /usr/src/wordpress
RUN set -eux; \
	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
	cp -s wp-config-docker.php wp-config.php
# We'll disable custom themes and plugins for now, unless you _really_
# want to make them work...
# COPY custom-theme/ ./wp-content/themes/custom-theme/
# COPY custom-plugin/ ./wp-content/plugins/custom-plugin/