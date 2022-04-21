#!/bin/bash
set -euo pipefail

#
# A (too) old version of Maven may be installed by default on Travis.
# This method is preferred over Travis apt installer because
# JDK is kept in cache.
#
function installMaven {
  echo "Setup Maven"
  mkdir -p ~/maven
  pushd ~/maven > /dev/null
  if [ ! -d "apache-maven-3.8.5" ]; then
    echo "Download Maven 3.8.5"
    curl -sSL http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz | tar zx -C ~/maven
  fi
  popd > /dev/null
  export M2_HOME=~/maven/apache-maven-3.8.5
  export PATH=$M2_HOME/bin:$PATH
}

installMaven
mvn clean install -B -e -V