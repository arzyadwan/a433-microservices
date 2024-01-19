# Gunakan base image Node.js versi 14
FROM node:15

# Tentukan working directory
WORKDIR /app

# Salin file package.json dan package-lock.json ke dalam /app
COPY package*.json ./

# Salin seluruh source code ke working directory di container
COPY . .

# Tentukan environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Instal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080
EXPOSE 8080

# Saat container diluncurkan, jalankan server
CMD ["npm", "start"]
