FROM hashicorp/terraform

ADD tf_files/* /workspace/
WORKDIR /workspace
RUN terraform init
