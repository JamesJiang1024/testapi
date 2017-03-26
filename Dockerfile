# This image should be renamed as golang/beego-ex

FROM centos:centos7

COPY testapi  /usr/bin/

RUN rm -f /etc/yum.repos.d/*.repo && \
    cd /etc/yum.repos.d && \
    curl -LJOs http://mirrors.163.com/.help/CentOS7-Base-163.repo && \
    yum clean all && \
    mkdir -p /var/lib/origin

WORKDIR /var/lib/origin

LABEL io.k8s.display-name="Beego Example" \
      io.k8s.description="This is a Beego Example."
ENTRYPOINT ["/usr/bin/testapi"]
