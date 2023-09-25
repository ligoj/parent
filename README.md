# :link: Universal parent [![Maven Central](https://maven-badges.herokuapp.com/maven-central/org.ligoj.parent/root/badge.svg)](https://maven-badges.herokuapp.com/maven-central/org.ligoj.parent/root)

Parent POM to get rid of all [Maven](https://maven.apache.org/index.html) issues and to reproduce the builds on any
seat.

[![License](http://img.shields.io/:license-mit-blue.svg)](http://gus.mit-license.org/)

This is a POM with tuned Maven configurations:

- All versions are fixed in properties for all plugins: the builds are always reproducible
- Preconfigured unit/integration tests and code coverage with [Jacoco](http://www.eclemma.org/jacoco/)
- Consistent encoding setting
- Preconfigured JAR/WAR
  for [build number](https://mvnrepository.com/artifact/org.codehaus.mojo/buildnumber-maven-plugin) and version
  in `MANIFEST.MF`

To benefit these features, add this parent to your `pom.xml`

```xml
<parent>
    <groupId>org.ligoj.parent</groupId>
    <artifactId>project</artifactId>
    <version>21.0.0</version>
    <relativePath/>
</parent>
```

### Managed plugins

| Plugin                                                                                                                                    | Version property        | Skip property                   | Profile |
|-------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|---------------------------------|---------|
| [org.apache.maven.plugins:maven-antrun-plugin](https://maven.apache.org/plugins/maven-antrun-plugin)                                      | plugin.antrun           |                                 |         |
| [org.apache.maven.plugins:maven-assembly-plugin](https://maven.apache.org/plugins/maven-assembly-plugin)                                  | plugin.assembly         |                                 |         |
| [org.apache.maven.plugins:maven-clean-plugin](https://maven.apache.org/plugins/maven-clean-plugin)                                        | plugin.clean            |                                 |         |
| [org.apache.maven.plugins:maven-compiler-plugin](https://maven.apache.org/plugins/maven-compiler-plugin)                                  | plugin.compiler         |                                 |         |
| [org.apache.maven.plugins:maven-dependency-plugin](https://maven.apache.org/plugins/maven-dependency-plugin)                              | plugin.dependency       |                                 |         |
| [org.apache.maven.plugins:maven-failsafe-plugin](http://maven.apache.org/surefire/maven-failsafe-plugin)                                  | plug.failsafe           | maven.it.skip skipITs [true]    | it      |
| [org.apache.maven.plugins:maven-gpg-plugin](https://maven.apache.org/plugins/maven-gpg-plugin)                                            | plugin.gpg              | gpg.skip [true]                 |         |
| [org.apache.maven.plugins:maven-project-info-reports-plugin](https://maven.apache.org/plugins/maven-project-info-reports-plugin)          | plugin.install          |                                 |         |
| [org.apache.maven.plugins:plugins:maven-project-info-reports-plugin](https://maven.apache.org/plugins/maven-antrun-plugin)                | plugin.info             |                                 |         |
| [org.apache.maven.plugins:maven-jar-plugin](https://maven.apache.org/plugins/maven-jar-plugin)                                            | plugin.jar              |                                 |         |
| [org.apache.maven.plugins:maven-javadoc-plugin](https://maven.apache.org/plugins/maven-javadoc-plugin)                                    | plugin.javadoc          | maven.javadoc.skip [true]       | javadoc |
| [org.apache.maven.plugins:maven-release-plugin](https://maven.apache.org/plugins/maven-release-plugin)                                    | plugin.release          |                                 |         |
| [org.apache.maven.plugins:maven-resources-plugin](https://maven.apache.org/plugins/maven-resources-plugin)                                | plugin.resources        |                                 |         |
| [org.apache.maven.plugins:maven-source-plugin](https://maven.apache.org/plugins/maven-source-plugin)                                      | plugin.source           |                                 | sources |
| [org.apache.maven.plugins:maven-surefire-plugin](http://maven.apache.org/surefire/maven-surefire-plugin)                                  | plugin.surefire         | maven.ut.skip skipTests [false] |         |
| [org.apache.maven.plugins:maven-surefire-report-plugin](http://maven.apache.org/surefire/maven-surefire-report-plugin)                    | plugin.surefire.report  |                                 |         |
| [org.apache.maven.plugins:maven-verifier-plugin](https://maven.apache.org/plugins/maven-verifier-plugin)                                  | plugin.verifier         |                                 |         |
| [org.apache.maven.plugins:maven-versions-plugin](https://maven.apache.org/plugins/maven-versions-plugin)                                  | plugin.versions         |                                 |         |
| [org.apache.maven.plugins:maven-war-plugin](https://maven.apache.org/plugins/maven-war-plugin)                                            | plugin.war              |                                 |         |     |
| [org.codehaus.mojo:buildnumber-maven-plugin](https://mvnrepository.com/artifact/org.codehaus.mojo/buildnumber-maven-plugin)               | plugin.buildnumber      |                                 |         |
| [org.codehaus.mojo:build-helper-maven-plugin](https://mvnrepository.com/artifact/org.codehaus.mojo/build-helper-maven-plugin)             | plugin.build-helper     |                                 |         |
| [org.codehaus.mojo:versions-maven-plugin](https://mvnrepository.com/artifact/org.codehaus.mojo/versions-maven-plugin)                     | plugin.versions         |                                 |         |
| [org.eluder.coveralls:coveralls-maven-plugin](https://mvnrepository.com/artifact/org.eluder.coveralls/coveralls-maven-plugin)             | plugin.coveralls        |                                 | jacoco  |
| [org.owasp:dependency-check-maven](https://mvnrepository.com/artifact/org.owasp/dependency-check-maven)                                   | plugin.dependency-check |                                 |         |
| [org.jacoco:jacoco-maven-plugin](https://mvnrepository.com/artifact/org.jacoco/jacoco-maven-plugin)                                       | plugin.jacoco           |                                 | jacoco  |
| [org.sonarsource.java:sonar-jacoco-listeners](https://mvnrepository.com/artifact/org.sonarsource.java/sonar-jacoco-listeners)             | plugin.jacoco.listeners |                                 | jacoco  |
| [org.sonarsource.scanner.maven:sonar-maven-plugin](https://mvnrepository.com/artifact/org.sonarsource.scanner.maven/sonar-maven-plugin)   | plugin.sonar            |                                 |         |
| [com.amashchenko.maven.plugin:gitflow-maven-plugin](https://mvnrepository.com/artifact/com.amashchenko.maven.plugin/gitflow-maven-plugin) | plugin.gitflow          |                                 |         |

### Sample Usage

`mvn -Pjacoco,sources`

Runs UTs with enabled coverage, produces `target\jacoco.exec`, produces `target\project-x.x.x.jar` with
the `MANIFEST.MF` entries, and `target\preject-x.x.x-source.jar`

#### Switch to a specific plugin version

`mvn -Dplugin.clean=3.0.0 -Dplugin.compiler=3.8.0`

#### Run ITs but not UTs

`mvn -Dmaven.ut.skip=true`
`mvn -DskipITs=true`

#### Run UTs but not ITs

`mvn -Dmaven.it.skip=true`

#### Skip all tests

`mvn -Dmaven.it.skip=true`
`mvn -DskipTests=true`

#### Manage the fork mode and other options for ITs and UTs

`mvn -Dmaven.ut.forkCount=2 -Dmaven.ut.reuseForks=true -Dmaven.ut.argLine.memory="-Xmx512m" -Dmaven.it.reuseForks=false -Dmaven.it.argLine.memory="-Xms400m -Xmx1600m" -Dmaven.it.testTimeout=600`

#### Prerequisites

`mvn -Dmaven.version=3.9.4 -Djdk.version=21`

#### Check updates

```bash
mvn versions:display-plugin-updates -Pjacoco,it,sources,javadoc
```

### Available sub parents

#### Maven Plugin project

```xml
<parent>
    <groupId>org.ligoj.parent</groupId>
    <artifactId>maven-plugin</artifactId>
    <version>21.0.0</version>
    <relativePath/>
</parent>
```

#### SonarQube Plugin project

```xml
<parent>
    <groupId>org.ligoj.parent</groupId>
    <artifactId>sonar-plugin</artifactId>
    <version>21.0.0</version>
    <relativePath />
</parent>
```