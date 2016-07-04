FROM fedora
MAINTAINER e2e team

RUN dnf -y update && dnf clean all
RUN dnf -y install ansible unzip jq

RUN mkdir /ose
ADD ./ose-on-aws-master-e7b885e38b94fb6f3f53efed7e3319d34afac34e.zip /ose/ose-on-aws-v0.2.zip
RUN cd ose/; unzip ose-on-aws-v0.2.zip
RUN pwd; cd ose; mv ose-on-aws-master-e7b885e38b94fb6f3f53efed7e3319d34afac34e/* /ose/.

RUN pip install awscli

WORKDIR /ose
