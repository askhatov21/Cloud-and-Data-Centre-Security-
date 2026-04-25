- op: replace
  path: /spec/template/spec/containers/0/image
  value: ${CI_REGISTRY_IMAGE}/wordpress-static:${WORDPRESS_VERSION}
- op: add
  path: /spec/template/spec/containers/0/env/0
  value:
    name: WORDPRESS_DB_PASSWORD
    value: "${WORDPRESS_DB_PASSWORD}"
- op: add
  path: /spec/template/spec/containers/0/env/0
  value:
    name: WORDPRESS_DB_USER
    value: ${WORDPRESS_DB_USER}
- op: add
  path: /spec/template/spec/containers/0/env/0
  value:
    name: WORDPRESS_DB_NAME
    value: ${WORDPRESS_DB_USER} # DB name same as DB username
