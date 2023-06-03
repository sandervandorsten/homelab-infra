# homelab-packer
IaC for my Homelab 
- VM images built using Packer
- Deployment of VM images using Terraform
- Virtualisation using proxmox


### Resources/inspiration
- https://github.com/ChristianLempa/boilerplates/tree/main/packer/proxmox/
- https://www.youtube.com/watch?v=LCjuiIswXGs&list=PLT98CRl2KxKHnlbYhtABg6cF50bYa8Ulo&ab_channel=LearnLinuxTV

## Requirements
- Proxmox VE server installed on an (old) pc that functions as a homelab server
  - you can follow [this tutorial](https://www.youtube.com/watch?v=u8E3-Zy9NvI&list=PLT98CRl2KxKHnlbYhtABg6cF50bYa8Ulo&index=2&ab_channel=LearnLinuxTV) to get started
- UNIX machine to work from with the following things installed:
  - `packer` (hashicorp)
  - `terraform` (hashicorp)

# Installation

# Proxmox manual configuration
- download ubuntu 22.04 and 20.04 live server and store iso

## Create VM Templates in Proxmox
### setup
1. setup your `credentials.pkr.hcl` file using the configuration from your Proxmox server. see [this tutorial](https://www.youtube.com/watch?v=1nf3WOEFq1Y&t=1008s&ab_channel=ChristianLempa) (somewhere around 8:00) on how to set that up
2. configure requirements for the VM template s.t. it works for you. This is heavily dependant on your proxmox installation and localization; I've copied as much as possible from the tutorial mentioned above  
```shell
cd packer/ubuntu-server-jammy-docker
packer init .
packer fmt .
packer validate \
  -var-file=../credentials.pkr.hcl \
  -var-file=variables.pkrvars.hcl \
  .
packer build \
  -var-file=../credentials.pkr.hcl \
  -var-file=variables.pkrvars.hcl \
  . 
```

## Create VM from VM template
### Manually
1. [Instructions](https://youtu.be/1nf3WOEFq1Y?t=1224)

### Terraform
1. setup your `credentials.auto.tfvars` file using the configuration from your Proxmox server. see [this tutorial](https://www.youtube.com/watch?v=1nf3WOEFq1Y&t=1008s&ab_channel=ChristianLempa) (somewhere around 8:00) on how to set that up

```shell
cd terraform
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars -auto-approve
```

# Install K3s
- create resource pool 'k3s' in proxmox cluster
TODO add description