# Menggunakan image Ubuntu terbaru
FROM ubuntu:20.04

# Menetapkan working directory
WORKDIR /home/runner

# Instalasi dependensi yang dibutuhkan
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    bash \
    sha256sum \
    sudo

# Salin script start.sh ke dalam container
COPY start.sh /home/runner/start.sh

# Berikan izin eksekusi pada start.sh
RUN chmod +x /home/runner/start.sh

# Buat user non-root untuk menjalankan runner
RUN useradd -m -s /bin/bash runner

# Berikan hak akses pada folder actions-runner
RUN chown -R runner:runner /home/runner

# Gunakan user non-root untuk menjalankan aplikasi
USER runner

# Jalankan script start.sh
CMD ["/home/runner/start.sh"]
