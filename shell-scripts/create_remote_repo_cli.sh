#!/usr/bin/env bash

## Make sure you have gh tool installed in your $PATH
if ! command -v gh &> /dev/null
then
    echo "You don't have gh installed. check [https://cli.github.com] to install"
    exit
fi

## Your github username
git_user="muhmdtaha"

## Creating repo directory 
read -p "Enter your repo name: " repo_name
mkdir $repo_name -p
echo "$repo_name is created in $PWD"

## Getting the directory name
last_pwd=$(echo $PWD |  sed "s@/@ @g" | awk '{print $NF}')

## Creating local repo
cd $repo_name
git init

## Creating dummy .gitignore file
echo -e "\nconf*\n.env\ndev-data\nworkspace\n" > .gitignore 

## Adding files to the working tree
git add .
read -p "Enter a commit message for your files: " commit_message
git commit -m "$commit_message..."

## Creating remote github repo using gh tool
gh repo create $repo_name --private
git remote add origin git@github.com:$git_user/$repo_name.git

## Pushing the local files to the remote repo
git push origin master
