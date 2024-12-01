#!/bin/bash

# Catatan: Di lingkungan Render, skrip mungkin dijalankan sebagai root. Abaikan pemeriksaan root.
echo "Running the GitHub Actions Runner setup..."

# Buat folder untuk runner dan pindah ke folder tersebut
mkdir -p actions-runner && cd actions-runner

# Unduh paket runner terbaru
echo "Downloading the latest GitHub Actions Runner..."
curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz

# Validasi hash (opsional)
echo "Validating the hash of the downloaded file..."
echo "ba46ba7ce3a4d7236b16fbe44419fb453bc08f866b24f04d549ec89f1722a29e  actions-runner-linux-x64-2.321.0.tar.gz" | sha256sum -c -
if [ $? -ne 0 ]; then
  echo "Error: Hash validation failed. Exiting."
  exit 1
fi

# Ekstrak installer
echo "Extracting the GitHub Actions Runner package..."
tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz

# Konfigurasi runner
echo "Configuring the GitHub Actions Runner..."
./config.sh --url https://github.com/Lincolncowper13/Henlinux --token BKDJR2G3PI4LMZ2W3ML65ALHJRY3C --unattended

# Jalankan runner
echo "Starting the GitHub Actions Runner..."
./run.sh
