## Base the image on CentOS 7
FROM centos:7

## Label Information
LABEL image-name="centos7_pdns-recursor"
LABEL maintainer="thomas.morgan@nagronia.co.uk"
 
## Install the required packages
RUN yum makecache
RUN yum upgrade -y
RUN yum install -y epel-release
RUN yum install -y dnsdist

## Copy the containers config file with basic settings.
COPY ./files/dnsdist.conf /etc/dnsdist/dnsdist.conf

## Expose the DNS ports 
EXPOSE 53/tcp
EXPOSE 53/udp

VOLUME "/etc/dnsdist/"

## Run DNSDist
ENTRYPOINT ["/bin/dnsdist", "--uid", "dnsdist", "--gid", "dnsdist"]
CMD ["--supervised", "--disable-syslog"]
