# Шаг 1: Сборка Nuxt
FROM node:18 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Шаг 2: Запуск Nuxt SSR-сервера
FROM node:18
WORKDIR /app
COPY --from=builder /app/.output ./
EXPOSE 3000
CMD ["node", "/app/server/index.mjs"]
