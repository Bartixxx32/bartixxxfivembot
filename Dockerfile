FROM node
WORKDIR /root/
RUN apt-get update
RUN apt-get upgrade -y
WORKDIR /tmp/
RUN wget https://www.rarlab.com/rar/rarlinux-x64-5.6.0.tar.gz
RUN tar -zxvf rarlinux-x64-5.6.0.tar.gz
WORKDIR /tmp/rar
RUN cp -v rar unrar /usr/local/bin/
WORKDIR /root/
RUN git clone https://github.com/ThatZiv/FiveM-Bot.git
WORKDIR /root/FiveM-Bot/
RUN unrar x extract_me.rar
RUN rm -r extract_me.rar
WORKDIR /root/FiveM-Bot/cmds/config
RUN wget https://gist.githubusercontent.com/Bartixxx32/101478778629d51f639ef844d9c3dc0f/raw/bc9cd42abe444198ff8110a0919a0ce6d94d651d/config.json -O config.json
WORKDIR /root/FiveM-Bot/cmds/
WORKDIR /root/FiveM-Bot/
ENTRYPOINT ["node", "/root/FiveM-Bot/fivem.js"]
