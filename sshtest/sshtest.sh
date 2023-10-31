#!/bin/bash


github_username="your own username"
github_repo="your-repo name"


ssh_key_path="$HOME/.ssh/id_rsa"


ssh-keygen -t rsa -C "your_email@example.com should be given here"


ssh-add $ssh_key_path


ssh_config="Host github.com
    HostName github.com
    User git
    IdentityFile $ssh_key_path"

echo "$ssh_config" > ~/.ssh/config

echo "SSH key generation and setup for GitHub completed!"

