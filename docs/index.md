# DevOps Cheat sheets

DevOps is a set of practices, tools, and a cultural philosophy that automate and integrate the processes between software development and IT teams.

DevOps is a methodology that promotes collaboration and automation between development (Dev) and IT operations (Ops) teams. It aims to streamline software development and delivery, automate repetitive tasks, and enhance code quality through continuous integration, continuous delivery, and cultural shifts, ultimately resulting in faster, more reliable software releases.

<!-- References:

- [RedHat - Understanding DevOps](https://www.redhat.com/en/topics/devops)
- [Altassian - What Is DevOps?](https://www.atlassian.com/devops) -->

## DevOps lifecycle

1. Plan
2. Code
3. Build
4. Test
5. Release
6. Deploy
7. Operate
8. Monitor

## IDEs / Editors

- [:simple-visualstudiocode: Visual Studio Code](./vscode.md)
- [:octicons-copilot-24: GitHub Copilot](./github-copilot.md)

## Source control

- [:simple-git: Git](./git.md)

## Command line

- [:simple-linux: Linux OS](./linux.md)
- [:simple-gnubash: Bash](./bash.md)
- [:simple-powershell: PowerShell](./powershell.md)
- [:simple-vim: Vim](./vim.md)

## Programming languages

- [:simple-python: Python](./python.md)
- Go
- .NET / ASP.NET
- JavaScript

## CI/CD

Continuous Integration and Continuous Delivery (CI/CD) is the method to frequently deliver apps to customers by introducing automation into the stages of app development.

- [:simple-githubactions: GitHub Actions](./github-actions.md)
- [:octicons-codespaces-16: GitHub Codespaces](./github-codespaces.md)

<!-- References:

- [RedHat - What is CI/CD?](https://www.redhat.com/en/topics/devops/what-is-ci-cd) -->

### CI

1. Automate the Build
2. Introduce Automation test (units tests, integration, ...)
3. Linting
4. Security / Scanning

Based on the workflow (like GitHub Flow > Git Flow) add Pull/Merge Request to be reviewed and approved by other collaborators.

### CD

- Environments: Dev -> Staging -> Prod
- User feedback (Blue/Green, Canary, ...)

## Containers

- [:simple-docker: Docker](./docker.md)

### Containers orchestation

- [:simple-kubernetes: Kubernetes](./kubernetes.md)

## Infrastructure as Code

Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through manual processes.

Tools:

- [:simple-terraform: Terraform](./terraform.md)

<!-- References:

- [RedHat - What is Infrastructure as Code (IaC)?](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac) -->

## Configuration as Code

Sometimes also called Software Configuration Management.

- [:simple-ansible: Ansible](./ansible.md)

## Networking

- [:fontawesome-solid-network-wired: CIDR](./networking.md)

## Cloud Computing

- [:simple-microsoftazure: Azure](./azure.md)
- AWS
- GCP

## Documentation

- [:simple-materialformkdocs: MkDocs](./mkdocs.md)
- [:simple-jekyll: Jekyll](./jekyll.md)

## Security

- Checkov
- CodeQL
- HashiCorp Vault

## Monitoring

- Graphana
- Prometheus
- ELK Stack

## Testing

## Linting

## Miscellany

- [:simple-databricks: Databricks](./databricks.md)

## Know more

- [GitHub - Libre DevOps](https://github.com/libre-devops)
- [GitHub - TL;DR DevOps](https://github.com/tldr-devops)
