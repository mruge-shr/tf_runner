FROM hashicorp/terraform AS tf 

FROM alpine/helm

COPY --from=tf /bin/terraform /bin/terraform

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN adduser -u $USER_UID -D $USERNAME 

USER $USERNAME

ENTRYPOINT [ "ash" ]