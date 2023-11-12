ARG OS=almalinux
ARG OS_IMAGE=9-base
ARG OS_IMAGE_VERSION=latest

FROM $OS/$OS_IMAGE:$OS_IMAGE_VERSION AS BASE_UPDATE

# Préparer OS et outil YUM
RUN yum upgrade -y
RUN yum install -y yum-utils

# Ajout dépôts
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

FROM BASE_UPDATE AS DEV_TOOLS

COPY . .

#RUN sudo ./yum.sh

RUN yum install -y python pip terraform packer

RUN pip install pre-commit

FROM DEV_TOOLS AS MAIN

RUN chmod 777 ./kubectl.sh
RUN ./kubectl.sh
