# Node 16: de versie waarmee de app gemaakt is (vue-cli 4.5).
FROM node:16.20.2-bookworm AS build
WORKDIR /app
COPY package.json package-lock.json .npmrc ./
RUN npm ci
COPY . .
# Leeg = zelfde adres als de app (nginx stuurt /api/ door naar de server). VUE_APP_* komt in de gebouwde JavaScript.
ARG VUE_APP_API=/
ARG VUE_APP_PUBLIC_API_KEY=
ARG VUE_APP_BAGEAN=
RUN VUE_APP_API=$VUE_APP_API VUE_APP_PUBLIC_API_KEY=$VUE_APP_PUBLIC_API_KEY VUE_APP_BAGEAN=$VUE_APP_BAGEAN npm run build

FROM nginx:1.27.3-alpine
COPY docker/default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /app/dist /usr/share/nginx/html
