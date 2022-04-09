#!/bin/bash -e
if [[ ${CIRCLECI} ]]; then
  echo "export ROOT_DIR=$1" >> $BASH_ENV
elif [[ ${GITHUB_ACTIONS} ]]; then
  sudo sh -c "chmod 777 $GITHUB_ENV"
  echo "ROOT_DIR=$1" >> $GITHUB_ENV
else
  export ROOT_DIR=$1
fi