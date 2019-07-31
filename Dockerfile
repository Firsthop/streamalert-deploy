FROM ubuntu:latest
RUN apt-get update && apt-get install -y python-dev python-pip
RUN apt-get install -y git
RUN pip install virtualenv 
RUN cd ~/ && git clone --branch stable https://github.com/airbnb/streamalert.git

RUN cd ~/streamalert && pip install -r requirements.txt
RUN pip install awscli
RUN cd ~/streamalert && tests/scripts/unit_tests.sh
RUN cd ~/streamalert 

RUN apt-get -y install curl jq unzip
RUN curl https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip > ~/terraform.zip
RUN cd ~/ && unzip terraform.zip && cp terraform /usr/local/bin/terraform

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
