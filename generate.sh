#!/bin/sh

REPOS="
actions
bananas-api
bananas-frontend-cli
bananas-frontend-web
bananas-server
dibridge
DorpsGek
eints
game-coordinator
master-server
master-server-web
py-helpers
py-protocol
survey-web
website
workflows
"

echo "## OpenTTD" > README.md
echo "| Name | PRs | " >> README.md
echo "| --- | --- | " >> README.md

for repo in ${REPOS}; do
    branch="main"

    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/OpenTTD/${repo}?label=)](https://github.com/OpenTTD/${repo}/pulls)" >> README.md
    echo "|" >> README.md
done


REPOS="
actions-flake8
truewiki
wikitexthtml
"

echo "## TrueBrain" >> README.md
echo "| Name | PRs |" >> README.md
echo "| --- | --- |" >> README.md

branch="main"
for repo in ${REPOS}; do
    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/TrueBrain/${repo}?label=)](https://github.com/TrueBrain/${repo}/pulls)" >> README.md
    echo "|" >> README.md
done
