# Gunakan base image Ubuntu
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl bash

# Set working directory
WORKDIR /app

# Copy semua file ke dalam container
COPY start.sh .

# Berikan izin eksekusi
RUN chmod +x start.sh

# Jalankan skrip
CMD ["bash", "start.sh"]
