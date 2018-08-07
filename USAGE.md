Add the following to your .bashrc or .profile script.

## Packer

alias packer='docker run --privileged -it -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest packer'

## Terraform

alias terraform='docker run -it -v $(pwd):/data ironbench/ib-toolbox:latest terraform'
alias tf='docker run -it -v $(pwd):/data ironbench/ib-toolbox:latest terraform'

## Chef

alias rubocop='docker run -it -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest chef exec rubocop'
alias chef='docker run -it -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest chef'
alias kitchen='docker run --privileged -it -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest kitchen'
alias foodcritic='docker run -it -v $(pwd):/data ironbench/ib-toolbox:latest foodcritic'
alias berks='docker run -it -v $(pwd):/data ironbench/ib-toolbox:latest berks'
alias knife='docker run -it -v $HOME/.chef:/root/.chef -v $(pwd):/data ironbench/ib-toolbox:latest knife'

# AWSpec
alias awspec='docker run -it -e AWS_PROFILE=$AWS_PROFILE -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest awspec'

# AWS
alias aws='docker run -it -v $HOME/.aws:/root/.aws -v $(pwd):/data ironbench/ib-toolbox:latest aws'
