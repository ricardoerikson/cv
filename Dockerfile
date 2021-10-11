FROM texlive/texlive:latest

RUN apt update && \
  apt install texlive-fonts-extra -y