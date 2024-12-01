# Gunakan image dasar yang tidak menjalankan root
FROM ubuntu:20.04

# Install dependencies (gunakan apt tanpa sudo)
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    bash \
    coreutils  # Menambahkan coreutils untuk mendapatkan sha256sum

# Buat folder untuk runner dan pindah ke sana
WORKDIR /actions-runner

# Salin skrip yang dibutuhkan
COPY start.sh /actions-runner/start.sh

# Tentukan hak akses untuk skrip (non-root user)
RUN chmod +x /actions-runner/start.sh

# Jalankan skrip start.sh
CMD ["./start.sh"]
