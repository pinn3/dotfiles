#!/usr/bin/env bash
set -e

here=$(realpath $(dirname "$0"))

$here/bash/setup.sh
$here/misc/setup.sh
$here/git/setup.sh
$here/emacs/setup.sh
