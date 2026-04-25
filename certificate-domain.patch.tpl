# This patch file is applied by kustomize to allow us to update simple options
# without re-writing the deployment file
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: wordpress-tls-cert
spec:
  commonName: ${DOMAIN_SHORT}
  dnsNames:
    - ${DOMAIN}
