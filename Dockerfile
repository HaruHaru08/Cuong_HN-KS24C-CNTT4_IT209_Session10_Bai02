# Base image: Node.js 18 trên Alpine Linux (nhẹ)
FROM node:18-alpine

# Thư mục làm việc trong container
WORKDIR /app

# Biến môi trường: cổng ứng dụng lắng nghe
ENV PORT=3000

# Copy package*.json trước để tận dụng cache layer khi cài dependency
COPY package*.json ./

# Cài dependency (chỉ production)
RUN npm install --omit=dev

# Copy toàn bộ mã nguồn
COPY . .

# Khai báo cổng container
EXPOSE 3000

# Lệnh khởi chạy (exec form)
CMD ["node", "server.js"]
