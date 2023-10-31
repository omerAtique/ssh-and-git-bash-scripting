#!/bin/bash

github_username="ammar313-cs"
github_repo="bash-"




commit_message="3rd commit"


git init

git add .


git commit -m "$commit_message"


git remote add origin "git@github.com:$github_username/$github_repo.git"


git push -u origin main


