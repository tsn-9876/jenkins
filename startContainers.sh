#!/bin/bash
port_cpa=2020
port_dpa=3030
port_scprmc=4040
port_fptsoc=5050
port_scpteachin=6060
port_tc_testcircle=7070
port_scptools=8080
port_dockerbuild=1234
jenkins_base=jenkins-tsl:latest
docker run -d --privileged --name oracle -p 10122:22 -p 1521:1521 -p 5500 -p 8080 --restart unless-stopped -v /home/rmc/jenkins-container-data/ora/12c-full/oradata:/u01/app/oracle/oradata -v /home/rmc/jenkins-container-data/ora/12c-full/fast_recovery_area:/u01/app/oracle/fast_recovery_area acx/oracle-12c:latest

docker run -d --name cpa -p $port_cpa:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-cpa:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name dpa -p $port_dpa:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-dpa:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random  $jenkins_base

docker run -d --name scprmc -p $port_scprmc:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-scprmc:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name fptsoc -p $port_fptsoc:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-fptsoc:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name scpteachin -p $port_scpteachin:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-scpteachin:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name TCTestCircle -p $port_tc_testcircle:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-tc-testcircle:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name SCPTools -p $port_scptools:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-scptools:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random $jenkins_base

docker run -d --name DockerBuild --privileged -p $port_dockerbuild:8080 --link oracle --dns=172.26.1.31 --restart unless-stopped -v /home/rmc/jenkins-container-data/jenkins-dockerbuild:/var/jenkins_home -v /home/rmc/jenkins-container-data/java:/opt/java -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/urandom:/dev/urandom -v /dev/urandom:/dev/random -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker $jenkins_base


#docker run -d --name registry -p 5000:5000 --restart=always registry:2
#docker run --name oraclexe-18c -d -p 51521:1521 -p 55500:5500 -v oracle-xe-DATA:/opt/oracle/oradata -e ORACLE_PWS=ssirmc123? -e ORACLE_CHARACTERSET=AL32UTF8 oracle-xe:18c
