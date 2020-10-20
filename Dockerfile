FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER root
RUN apt-get update
RUN apt-get install -y xvfb
RUN apt-get install -y vim
RUN apt-get install -y netcat
RUN apt-get install -y telnet
RUN apt-get install -y openjdk-8-jdk
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True update
RUN apt-get install -y -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True graphviz
#RUN apt-get install libwebkitgtk-3.0-0
RUN apt-get clean
