#!/bin/bash

# Buat folder untuk action runner
mkdir actions-runner && cd actions-runner

# Download package runner terbaru
curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz

# Opsional: Validasi hash
echo "ba46ba7ce3a4d7236b16fbe44419fb453bc08f866b24f04d549ec89f1722a29e  actions-runner-linux-x64-2.321.0.tar.gz" | shasum -a 256 -c

# Ekstrak file installer
tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz

# Konfigurasi runner dengan GitHub repository
./config.sh --url https://github.com/Lincolncowper13/Henlinux --token BKDJR2DPN323VAX4R6A3EETHJRRMG

# Jalankan runner
./run.sh
