FROM almalinux/9-base:latest AS base_update

# Préparer OS et outil YUM
RUN yum upgrade -y
RUN yum install -y yum-utils

# Ajout dépôts
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

FROM base_update AS dev_tools

COPY . .

#RUN sudo ./yum.sh

RUN yum install -y python pip terraform packer

RUN pip install pre-commit

FROM dev_tools AS main

RUN chmod 777 ./kubectl.sh
RUN ./kubectl.sh
