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
RUN rm -r fivem.js
RUN wget https://gist.githubusercontent.com/Bartixxx32/ca2896aa257393ad95255c52f7ad1ed4/raw/2f53e78eaaccb64dbc5891deff0a01edee0e3e99/fivem.js -O fivem.js
RUN rm -r fivem.png
RUN wget https://i.imgur.com/SjySvVe.png -O fivem.png
RUN unrar x extract_me.rar
RUN rm -r extract_me.rar
WORKDIR /root/FiveM-Bot/cmds/config
RUN wget https://gist.githubusercontent.com/Bartixxx32/101478778629d51f639ef844d9c3dc0f/raw/a36487067ef66e0bc3b8a3e8eda2432b96d61e3b/config.json -O config.json
WORKDIR /root/FiveM-Bot/cmds/
RUN rm -r help.js
RUN wget https://gist.githubusercontent.com/Bartixxx32/ca2896aa257393ad95255c52f7ad1ed4/raw/2f53e78eaaccb64dbc5891deff0a01edee0e3e99/help.js -O help.js
WORKDIR /root/FiveM-Bot/
ENTRYPOINT ["node", "/root/FiveM-Bot/fivem.js"]
