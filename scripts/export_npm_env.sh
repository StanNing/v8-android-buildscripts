#!/bin/bash -e

source $(dirname $0)/env.sh
if [[ ${CIRCLECI} ]]; then
  echo "export VERSION=${npm_package_version}" >> $BASH_ENV
  echo "export V8_VERSION=${npm_package_config_V8}" >> $BASH_ENV
  echo "export ROOT_DIR=${ROOT_DIR}" >> $BASH_ENV
elif [[ ${GITHUB_ACTIONS} ]]; then
  sudo sh -c "chmod 777 $GITHUB_ENV"
  echo "VERSION=${npm_package_version}" >> $GITHUB_ENV
  echo "V8_VERSION=${npm_package_config_V8}" >> $GITHUB_ENV
  echo "ROOT_DIR=${ROOT_DIR}" >> $GITHUB_ENV
else
  export VERSION=${npm_package_version}
  export V8_VERSION=${npm_package_config_V8}
  export ROOT_DIR=${ROOT_DIR}
fi

echo "ROOT_DIR=${ROOT_DIR}"