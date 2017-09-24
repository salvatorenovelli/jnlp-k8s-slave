
FROM jenkinsci/jnlp-slave

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

USER root

RUN apt-get update -y
RUN apt-get install -y jq \
      libapparmor-dev \
      libseccomp-dev

RUN curl https://sdk.cloud.google.com | bash && mv google-cloud-sdk /opt
RUN gcloud components install kubectl

RUN curl -sL https://deb.nodesource.com/setup_8.x | /bin/bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

ENTRYPOINT /bin/cat
