# Préparation OS et yum
yum upgrade -y
yum install -y yum-utils

# Ajout dépôts
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# Install paquets
yum install -y python pip terraform packer
