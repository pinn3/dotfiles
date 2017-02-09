#!/bin/bash

if [ -z "$1" ]
then
    git --help
else
    command=$@
    repositories=($(find ./ -name ".git"))
    for repository in ${repositories[*]};
    do
        repository="${repository%/.git}"
        repository="${repository#.//}"
        echo "${repository}:"
        (cd $repository && git $command)
        echo
    done
fi
