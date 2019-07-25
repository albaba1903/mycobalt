export MAVEN_OPTS="-Xms512m -Xmx2048m -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5008"
mvn clean install -DskipTests