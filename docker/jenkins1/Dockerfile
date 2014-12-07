FROM centos

ENV LANG en_US.UTF-8

# Upgrade to latest version
#RUN rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm &&\
    yum -y upgrade

# Install core modules
RUN yum -y install curl ntp sudo unzip wget &&\
    yum -y clean all

# Time Zone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN ntpdate ntp.nict.jp

# Install Open JDK 7
RUN yum -y install java-1.7.0-openjdk &&\
    yum -y clean all

# Install Jenkins
RUN groupadd -g 1001 jenkins
RUN useradd -c "Jenkins Continuous Build server" \
        -u 1001 -g 1001 -d /var/lib/jenkins -s /bin/bash jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo &&\
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key &&\
    yum -y install jenkins &&\
    yum -y clean all

# Install Jenkins Plugins
RUN wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins \
        https://updates.jenkins-ci.org/latest/scm-api.hpi &&\
    wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins \
        https://updates.jenkins-ci.org/latest/git-client.hpi &&\
    wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins \
        https://updates.jenkins-ci.org/latest/git.hpi &&\
    wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins \
        https://updates.jenkins-ci.org/latest/ansicolor.hpi &&\
    chown -R jenkins:jenkins /var/lib/jenkins/plugins

# Install Subversion
RUN yum -y install subversion &&\
    yum -y clean all

# Install Git
RUN yum -y install git &&\
    yum -y clean all

EXPOSE 8080
ENTRYPOINT service jenkins start &&\
    sleep 5 &&\
    tail -f /var/log/jenkins/jenkins.log
