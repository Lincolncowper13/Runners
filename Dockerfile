FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl bash coreutils

# Set working directory
WORKDIR /app

# Copy start.sh ke dalam container
COPY start.sh .

# Berikan izin eksekusi
RUN chmod +x start.sh

# Jalankan skrip
CMD ["bash", "start.sh"]
