#!/bin/sh

setup_git() {
  git config --global user.email "$GITHUB_MAIL"
  git config --global user.name "$GITHUB_USER"
}

commit_version() {
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/Sparkness/v2ray-tls-docker.git > /dev/null 2>&1
  git push --quiet
}

setup_git
commit_version
upload_files
