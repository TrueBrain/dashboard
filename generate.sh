#!/bin/sh

REPOS="
actions
bananas-api
bananas-frontend-cli
bananas-frontend-web
bananas-server
DorpsGek
dibridge
eints
game-coordinator
master-server
master-server-web
nml
OpenTTD
py-helpers
website
workflows
"

REPOS_MASTER="
nml
OpenTTD
"

echo "## OpenTTD" > README.md
echo "| Name | PRs | Commits | Release | Staging | Production |" >> README.md
echo "| --- | --- | --- | --- | --- | --- |" >> README.md

for repo in ${REPOS}; do
    branch="main"
    for repo_master in ${REPOS_MASTER}; do
        if [ "${repo}" = "${repo_master}" ]; then
            branch="master"
        fi
    done

    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/OpenTTD/${repo}?label=)](https://github.com/OpenTTD/${repo}/pulls)" >> README.md
    if [ "${repo}" = "workflows" ]; then
        echo -n "|" >> README.md
    else
        echo -n "| [![Commits ${repo}](https://img.shields.io/github/commits-since/OpenTTD/${repo}/latest/${branch}?label=)](https://github.com/OpenTTD/${repo}/commits/${branch})" >> README.md
    fi
    if [ "${repo}" = "nml" ] || [ "${repo}" = "py-helpers" ] || [ "${repo}" = "DorpsGek" ] || [ "${repo}" = "dibridge" ]; then
        echo -n "| [![Release Workflow ${repo}](https://img.shields.io/github/actions/workflow/status/OpenTTD/${repo}/release.yml?label=)](https://github.com/OpenTTD/${repo}/actions/workflows/release.yml)" >> README.md
    elif [ "${repo}" = "actions" ] || [ "${repo}" = "OpenTTD" ] || [ "${repo}" = "workflows" ] || [ "${repo}" = "bananas-frontend-cli" ]; then
        echo -n "|" >> README.md
    else
        echo -n "| [![Publish Workflow ${repo}](https://img.shields.io/github/actions/workflow/status/OpenTTD/${repo}/publish.yml?label=)](https://github.com/OpenTTD/${repo}/actions/workflows/publish.yml)" >> README.md
    fi
    if [ "${repo}" = "nml" ] || [ "${repo}" = "py-helpers" ] || [ "${repo}" = "actions" ] || [ "${repo}" = "OpenTTD" ] || [ "${repo}" = "workflows" ] || [ "${repo}" = "bananas-frontend-cli" ]; then
        echo -n "|" >> README.md
        echo -n "|" >> README.md
    else
        if [ "${repo}" = "DorpsGek" ]; then
            echo -n "|" >> README.md
        else
            echo -n "| [![Staging ${repo}](https://img.shields.io/github/deployments/OpenTTD/${repo}/staging?label=)](https://github.com/OpenTTD/${repo}/deployments)" >> README.md
        fi
        echo -n "| [![Production ${repo}](https://img.shields.io/github/deployments/OpenTTD/${repo}/production?label=)](https://github.com/OpenTTD/${repo}/deployments)" >> README.md
    fi
    echo "|" >> README.md
done


REPOS="
actions-flake8
truewiki
wikitexthtml
"

echo "## TrueBrain" >> README.md
echo "| Name | PRs | Commits | Release | Staging | Production |" >> README.md
echo "| --- | --- | --- | --- | --- | --- |" >> README.md

branch="main"
for repo in ${REPOS}; do
    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/TrueBrain/${repo}?label=)](https://github.com/TrueBrain/${repo}/pulls)" >> README.md
    echo -n "| [![Commits ${repo}](https://img.shields.io/github/commits-since/TrueBrain/${repo}/latest/${branch}?label=)](https://github.com/TrueBrain/${repo}/commits/${branch})" >> README.md
    if [ "${repo}" = "wikitexthtml" ]; then
        echo -n "| [![Release Workflow ${repo}](https://img.shields.io/github/actions/workflow/status/TrueBrain/${repo}/release.yml?label=)](https://github.com/TrueBrain/${repo}/actions/workflows/release.yml)" >> README.md
    else
        echo -n "|" >> README.md
    fi
    if [ "${repo}" = "actions-flake8" ] || [ "${repo}" = "truewiki" ] || [ "${repo}" = "wikitexthtml" ]; then
        echo -n "|" >> README.md
        echo -n "|" >> README.md
    else
        echo -n "| [![Staging ${repo}](https://img.shields.io/github/deployments/TrueBrain/${repo}/staging?label=)](https://github.com/TrueBrain/${repo}/deployments)" >> README.md
        echo -n "| [![Production ${repo}](https://img.shields.io/github/deployments/TrueBrain/${repo}/production?label=)](https://github.com/TrueBrain/${repo}/deployments)" >> README.md
    fi
    echo "|" >> README.md
done
