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
COPY init.sh .
COPY --from=build /app/dist/linux-unpacked .
ENTRYPOINT [ "/bin/bash", "--init-file", "/app/init.sh" ]
