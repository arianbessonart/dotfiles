FROM ubuntu:16.04
LABEL maintainer="Arian Bessonart <arianbessonart@gmail.com>"

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

RUN useradd -m arianbessonart
USER arianbessonart

# Bootstrapping packages needed for installation
# RUN \
#   apt-get update && \
#   apt-get install -yqq \
#   locales
# lsb-release \
# software-properties-common && \
# apt-get clean

# Set locale to UTF-8
# ENV LANGUAGE en_US.UTF-8
# ENV LANG en_US.UTF-8
# RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
#   /usr/sbin/update-locale LANG=$LANG

COPY . $HOME/dotfiles/
WORKDIR $HOME/dotfiles

RUN apt-get install find

RUN "find . -name '*.sh'"
# RUN "find . -name \"*.sh\" -exec chmod +x {} \;"

# Run a zsh session
CMD [ "./setup.sh" ]
