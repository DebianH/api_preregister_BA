# Etapa de construcción
FROM node:20.16.0

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Copia el resto del código fuente
COPY . .

# Instala todas las dependencias y genera el cliente Prisma
RUN npm install && \
	npx prisma generate

# Expone el puerto de la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "start"]