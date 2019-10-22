#!/usr/bin/env bash
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


echo "removes git ... "
rm -rf .git

read -p "Please input project name: " projectName

mv ../django_init_repo ../$projectName
mv _PROJECT_NAME_ $projectName
grep -rl _PROJECT_NAME_ --exclude=install.sh . | xargs sed -i '' "s/_PROJECT_NAME_/${projectName}/g"

echo "${green} successfully changed names ... ${reset}"

echo "${green} initialize git ... ${reset}"
git init

echo "${green} git validator ... ${reset}"
wget -O git_validator.sh https://raw.githubusercontent.com/hemdesignstudio/git_validator/master/install.sh
chmod +x git_validator.sh
./git_validator.sh
rm git_validator.sh
echo "${green} install dependecies ... ${reset}"

pipenv install --dev

echo "${green} makemigrations ... ${reset}"

pipenv run python manage.py makemigrations

echo "${green}Done ... ${reset}"

rm install.sh