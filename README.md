# ib-toolbox Cookbook

Installs tools required to run various IronBench products.

## Requirements

### Platforms

- Debian 9
- Ubuntu 18.04
- RHEL/CentOS

### Chef

- Chef 13.2+

## Attributes

* `node['ib-toolbox']['packer']['directory']` - Directory where Packer is installed.
* `node['ib-toolbox']['packer']['link']` - Symlink from installation directory to somewhere in the system path.
* `node['ib-toolbox']['terraform']['directory']` - Directory where Terraform is installed.
* `node['ib-toolbox']['terraform']['link']` - Symlink from installation directory to somewhere in the system path.

## Recipes

### default

Installs Packer, Terraform, ChefDK, and other tools required to run various
IronBench products

### packer

Just installs Packer

### terraform

Just installs Terraform
