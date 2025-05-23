FROM debian:bookworm

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    git sudo wget curl clang \ 
    && useradd cp && usermod -aG sudo cp
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir /home/cp
COPY ./ /home/cp/dotfiles
RUN chown -R 1000:1000 /home/cp && cd /home/cp
USER cp
WORKDIR /home/cp

RUN cd dotfiles && git submodule update --init && sudo scripts/prerequisites.sh && \
    sudo scripts/install_coretto.sh 21 && \
    ./install

RUN sudo chsh -s /bin/bash cp

CMD ["tmux"]
