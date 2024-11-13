# Usa la imagen de Node para construir el proyecto
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Usa una imagen ligera para correr la app en producción
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY package*.json ./
RUN npm install --only=production

CMD ["node", "dist/main"]
