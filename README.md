# Cloud-and-Data-Centre-Security

Secure Cloud-Native App Deployment — DevSecOps
Kubernetes + GitLab CI/CD + SAST/DAST Security Pipeline
<img width="597" height="227" alt="Снимок экрана 2026-04-25 в 5 37 09 PM" src="https://github.com/user-attachments/assets/158d6f70-ba64-4c67-aeac-756e9ddbc095" />
<img width="582" height="463" alt="Снимок экрана 2026-04-25 в 5 37 43 PM" src="https://github.com/user-attachments/assets/61394255-f028-48e2-9a7b-4fc4ec53817f" />
<img width="670" height="257" alt="Снимок экрана 2026-04-25 в 5 37 34 PM" src="https://github.com/user-attachments/assets/27dd9151-967c-459e-abba-527bf5c375ae" />
<img width="252" height="260" alt="Снимок экрана 2026-04-25 в 5 37 23 PM" src="https://github.com/user-attachments/assets/dc26305e-bb89-4f31-9475-3d991502de67" />
<img width="545" height="578" alt="Снимок экрана 2026-04-25 в 5 38 32 PM" src="https://github.com/user-attachments/assets/b3141df2-9639-492a-be96-6042cd5dbf3d" />
<img width="676" height="460" alt="Снимок экрана 2026-04-25 в 5 38 13 PM" src="https://github.com/user-attachments/assets/a3d7d672-a195-473e-9b2b-bc7f2777a12f" />


Overview
Deployed a secure WordPress application to a Kubernetes cluster using GitLab CI/CD with security integrated at every stage of the pipeline. Acted as the DevSecOps engineer responsible for both deployment and security tooling.
Course: CP2422 Cloud and Data Centre Security — James Cook University Singapore
Date: August 2025

Architecture
GitLab CI/CD Pipeline
├── Stage 1: BUILD
│   └── Build WordPress Docker image → push to private registry
├── Stage 2: DEPLOY
│   └── Deploy to Kubernetes cluster via kubectl + Kustomize
└── Stage 3: TEST (Security)
    ├── container_scanning  (Trivy — SAST)
    ├── dynamic_test        (OWASP ZAP — DAST)
    ├── kics-iac-sast       (GitLab IaC scanning)
    └── testssl             (TLS/HTTPS assessment)

Security Tools Integrated
1. Trivy — Container SAST
Scanned WordPress:latest Docker image before deployment.
Results:

Total vulnerabilities found: 1,380
Critical: 5 | High: 242 | Medium: 610 | Low: 519
Documented remediation strategy (minimal base image, regular rescanning)

2. OWASP ZAP — DAST
Ran baseline scan against live Kubernetes endpoint.
Key findings (16 warnings):

Missing Anti-clickjacking Header (10 instances)
Content Security Policy (CSP) Header Not Set (11 instances)
Absence of CSRF Tokens (2 instances)
Server Version Disclosure via HTTP headers

3. testssl.sh — TLS Assessment
Assessed HTTPS/TLS configuration of deployed application.
Issues identified:

TLS 1.0 and TLS 1.1 still enabled
HSTS not configured
Self-signed certificate trust issues
Domain name mismatch

4. Kustomize — Kubernetes Configuration Management
Managed manifests, patches, TLS certificates, WAF rules (.htaccess via ConfigMap) without modifying original YAML files.

Stack
ToolPurposeKubernetes (K3s)Container orchestrationGitLab CI/CDAutomated pipelineDockerContainerizationTrivyContainer vulnerability scanning (SAST)OWASP ZAPDynamic application security testing (DAST)testssl.shTLS/HTTPS security assessmentKustomizeKubernetes manifest managementAzure CloudCloud environment review

Repository Contents
├── .gitlab-ci.yml              # Full CI/CD pipeline configuration
├── kubernetes/
│   ├── wordpress.yaml          # WordPress deployment manifest
│   ├── traefik-tls.yaml        # TLS ingress configuration
│   ├── pki.yaml                # PKI/certificate setup
│   ├── kustomization.yaml      # Kustomize configuration
│   └── patches/                # Environment-specific patches
├── Dockerfile                  # WordPress container definition
└── README.md

Key Learnings

Even popular public Docker images can contain hundreds of vulnerabilities — image choice and regular scanning matter
Security headers (CSP, X-Frame-Options, HSTS) are often overlooked but critical for preventing XSS and clickjacking
Shifting security left into CI/CD catches issues before production deployment
TLS configuration requires careful attention beyond just "having HTTPS"


About
Amir Askhatov — Junior Cybersecurity Analyst
Bachelor of Cybersecurity, James Cook University Singapore
LinkedIn | GitHub
