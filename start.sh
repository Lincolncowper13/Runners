#!/bin/bash

# Buat folder untuk runner dan pindah ke folder tersebut
echo "Creating runner directory..."
mkdir -p /home/runner/actions-runner && cd /home/runner/actions-runner

# Unduh paket runner terbaru
echo "Downloading GitHub Actions Runner..."
curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz

# Validasi hash (opsional, tapi memastikan file yang diunduh aman)
echo "Validating the hash of the downloaded file..."
echo "ba46ba7ce3a4d7236b16fbe44419fb453bc08f866b24f04d549ec89f1722a29e  actions-runner-linux-x64-2.321.0.tar.gz" | sha256sum -c -
if [ $? -ne 0 ]; then
  echo "Error: Hash validation failed. Exiting."
  exit 1
fi

# Ekstrak installer
echo "Extracting GitHub Actions Runner package..."
tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz

# Buat user baru untuk menjalankan runner (bukan root)
echo "Creating a non-root user for the runner..."
useradd -m -s /bin/bash runner

# Berikan hak akses ke direktori runner
chown -R runner:runner /home/runner/actions-runner

# Pindah ke direktori runner
cd /home/runner/actions-runner

# Konfigurasi runner
echo "Configuring GitHub Actions Runner..."
sudo -u runner ./config.sh --url https://github.com/Lincolncowper13/Henlinux --token $RUNNER_TOKEN --unattended

# Jalankan runner
echo "Starting the GitHub Actions Runner..."
sudo -u runner ./run.sh
