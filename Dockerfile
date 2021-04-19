FROM jenkins/jenkins:latest
USER root
# Install base packages
RUN apt-get update -y && \
    apt-get install apt-transport-https curl python-dev python-setuptools gcc make libssl-dev jq -y && \
    apt-get install python-pip -y \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*
# Install Python packages
RUN pip install ansible boto boto3 awscli --no-cache-dir
#install TFENV
RUN git clone --depth 1 https://github.com/tfutils/tfenv.git ~/.tfenv && \
    ln -s ~/.tfenv/bin/* /usr/local/bin && \
    tfenv install 0.12.19