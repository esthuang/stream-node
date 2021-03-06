#!/usr/bin/env bash

alias mocha='../node_modules/mocha/bin/mocha'

# Abort script at first error
set -e

function fail {
  echo -e "######## \033[31m  ✘ $1\033[0m"
  exit 1
}

function success {
  echo -e "\033[32m------------> ✔ $1\033[0m"
}

function spec {
  [ $? -eq 0 ] || fail "$1"
  success "$1"
}

mocha ./test/base.mocha.js; spec "base"
mocha ./test/backends/mongoose.mocha.js; spec "mongoose backend"
