FROM electronuserland/builder as build
WORKDIR /app
COPY drawio-desktop .
RUN npm install
RUN npx electron-builder --config electron-builder-linux-mac.json --publish never
FROM debian
WORKDIR /app
COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh \
 && apt-get update \
 && apt-get install --no-install-recommends -y libgbm1 libasound2 xvfb libgtk-3-0
COPY --from=build /app/dist/linux-unpacked .
ENTRYPOINT [ "docker-entrypoint.sh" ]