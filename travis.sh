#!/bin/bash
set -euo pipefail

#
# Maven 3.2.5 is installed by default on Travis. Maven 3.3.9 is preferred.
#
function installMaven {
  echo "Setup Maven"
  mkdir -p ~/maven
  pushd ~/maven > /dev/null
  if [ ! -d "apache-maven-3.3.9" ]; then
    echo "Download Maven 3.3.9"
    curl -sSL http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar zx -C ~/maven
  fi
  popd > /dev/null
  export M2_HOME=~/maven/apache-maven-3.3.9
  export PATH=$M2_HOME/bin:$PATH
}
installMaven
mvn clean install -B -e -V