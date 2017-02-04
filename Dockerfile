FROM centos:centos6

MAINTAINER spica

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all


RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN sed -i -e "s/packages\/centos/packages\/mainline\/centos/" /etc/yum.repos.d/nginx.repo
RUN yum install -y  --enablerepo=nginx nginx-1.11.9
 


ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

ADD http  /var/www

EXPOSE 80


CMD ["service","nginx","start"]

