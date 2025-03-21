#!/bin/bash

ansible-playbook -K ansible/playbook.yml
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
