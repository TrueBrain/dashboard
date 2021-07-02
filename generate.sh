#!/bin/sh

REPOS="
actions
bananas-api
bananas-frontend-cli
bananas-frontend-web
bananas-server
DorpsGek
eints
master-server
master-server-web
nml
OpenTTD
py-helpers
website
workflows
"

REPOS_MAIN="
actions
DorpsGek
"

echo "## OpenTTD" > README.md
echo "| Name | PRs | Commits | Release | Staging | Production |" >> README.md
echo "| --- | --- | --- | --- | --- | --- |" >> README.md

for repo in ${REPOS}; do
    branch="master"
    for repo_main in ${REPOS_MAIN}; do
        if [ "${repo}" = "${repo_main}" ]; then
            branch="main"
        fi
    done

    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/OpenTTD/${repo}?label=)](https://github.com/OpenTTD/${repo}/pulls)" >> README.md
    if [ "${repo}" = "workflows" ]; then
        echo -n "|" >> README.md
    elif [ "${repo}" = "eints" ]; then
        echo -n "| [![Commits ${repo}](https://img.shields.io/github/commits-since/OpenTTD/${repo}/latest/${branch}?label=)](https://github.com/OpenTTD/${repo}/commits/${branch})" >> README.md
        echo -n " / [![Commits ${repo}](https://img.shields.io/github/commits-since/OpenTTD/${repo}/latest/openttd-github?label=)](https://github.com/OpenTTD/${repo}/commits/openttd-github)" >> README.md
    else
        echo -n "| [![Commits ${repo}](https://img.shields.io/github/commits-since/OpenTTD/${repo}/latest/${branch}?label=)](https://github.com/OpenTTD/${repo}/commits/${branch})" >> README.md
    fi
    if [ "${repo}" = "nml" ] || [ "${repo}" = "py-helpers" ]; then
        echo -n "| [![Release Workflow ${repo}](https://img.shields.io/github/workflow/status/OpenTTD/${repo}/Release?label=)](https://github.com/OpenTTD/${repo}/actions?query=workflow%3A%22Release%22)" >> README.md
    elif [ "${repo}" = "actions" ] || [ "${repo}" = "OpenTTD" ] || [ "${repo}" = "workflows" ] || [ "${repo}" = "bananas-frontend-cli" ]; then
        echo -n "|" >> README.md
    else
        echo -n "| [![Publish Workflow ${repo}](https://img.shields.io/github/workflow/status/OpenTTD/${repo}/Publish%20image?label=)](https://github.com/OpenTTD/${repo}/actions?query=workflow%3A%22Publish%20image%22)" >> README.md
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

REPOS_MAIN="
actions=flake8
truewiki
"

echo "## TrueBrain" >> README.md
echo "| Name | PRs | Commits | Release | Staging | Production |" >> README.md
echo "| --- | --- | --- | --- | --- | --- |" >> README.md

for repo in ${REPOS}; do
    branch="master"
    for repo_main in ${REPOS_MAIN}; do
        if [ "${repo}" = "${repo_main}" ]; then
            branch="main"
        fi
    done

    echo -n "| ${repo}" >> README.md
    echo -n "| [![PRs ${repo}](https://img.shields.io/github/issues-pr/TrueBrain/${repo}?label=)](https://github.com/TrueBrain/${repo}/pulls)" >> README.md
    echo -n "| [![Commits ${repo}](https://img.shields.io/github/commits-since/TrueBrain/${repo}/latest/${branch}?label=)](https://github.com/TrueBrain/${repo}/commits/${branch})" >> README.md
    if [ "${repo}" = "wikitexthtml" ]; then
        echo -n "| [![Release Workflow ${repo}](https://img.shields.io/github/workflow/status/TrueBrain/${repo}/Release?label=)](https://github.com/TrueBrain/${repo}/actions?query=workflow%3A%22Release%22)" >> README.md
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
