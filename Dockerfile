FROM electronuserland/builder as build
WORKDIR /app
COPY drawio-desktop .
RUN npm install
RUN npx electron-builder --config electron-builder-linux-mac.json --publish never

FROM debian
RUN apt-get update \
 && apt-get install --no-install-recommends -y libgbm1 libnss3 libasound2 xvfb libgtk-3-0
ENV DRAWIO_DISABLE_UPDATE true
WORKDIR /app
COPY drawio.sh /usr/local/bin/drawio
RUN chmod +x /usr/local/bin/drawio \
 && sed -i 's/\x0D$//' /usr/local/bin/drawio
COPY --from=build /app/dist/linux-unpacked .
WORKDIR /root
ENTRYPOINT [ "/usr/local/bin/drawio" ]
