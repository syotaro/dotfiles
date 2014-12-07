FROM centos:centos6

MAINTAINER syotaro

# Install Packages
RUN yum update -y
RUN yum install wget java-1.7.0-openjdk -y
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/red
hat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install jenkins -y

EXPOSE 8080
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
