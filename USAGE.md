Add the following to your .bashrc or .profile script.

## Packer

alias packer='docker run -it -v $(pwd):/data ironbench/ib-toolbox:branch packer'

## Terraform

alias terraform='docker run -it -v $(pwd):/data ironbench/ib-toolbox:branch terraform'
alias tf='docker run -it -v $(pwd):/data ironbench/ib-toolbox:branch terraform'
