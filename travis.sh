#!/bin/bash
set -euo pipefail

function installMaven {
  echo "Setup Maven"
  mkdir -p ~/maven
  pushd ~/maven > /dev/null
  if [ ! -d "apache-maven-3.5.2" ]; then
    echo "Download Maven 3.5.2"
    curl -sSL http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz | tar zx -C ~/maven
  fi
  popd > /dev/null
  export M2_HOME=~/maven/apache-maven-3.5.2
  export PATH=$M2_HOME/bin:$PATH
}
installMaven
mvn clean install -B -e -V