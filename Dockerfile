FROM node:13.7.0-slim

RUN apt-get update && \
apt-get install -yq git curl vim inetutils-ping gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget && \
apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

ADD package.json ./
ADD case/ ./case/
ADD src/ ./src/

RUN npm config set registry https://registry.npm.taobao.org

RUN npm install -g jest@25.1.0
RUN npm install

# Set language to UTF8.
ENV LANG="C.UTF-8"

