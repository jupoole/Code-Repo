FROM ubuntu:16.04

# docker build -f Dockerfile -t ansible2.7 .
# docker run --name ansible2.7 -v ./:/asa -it ansible2.7 bash
# docker run --name ansible2.7 -v $(pwd):/asa -it ansible2.7 bash


MAINTAINER Justin Poole <jupoole@cisco.com>

RUN apt-get update -y
RUN apt-get install -y python-software-properties wget git curl unzip libssl-dev && \
    apt-get install -y libffi-dev python-pip vim sshpass tree man iputils-ping && \
    apt-get install -y tcptraceroute sshpass traceroute openssh-server hping3
RUN pip install --upgrade setuptools cffi
RUN pip install lxml urllib3 terminal pyopenssl pyasn1 ndg-httpsclient mock && \
    pip install ncclient textfsm yamllint netaddr napalm requests pyntc json_query jmespath
RUN service ssh start
RUN pip install ansible==2.7.5
