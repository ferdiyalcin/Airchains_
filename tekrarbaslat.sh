#!/bin/bash

# Kullanıcıdan kaç dakikada bir çalıştırmak istediğini sor
read -p "Komutun kaç dakikada bir çalıştırılmasını istersiniz? " interval

# Kullanıcının girdiği değeri kontrol et ve geçerli bir sayı olup olmadığını doğrula
if ! [[ "$interval" =~ ^[0-9]+$ ]]; then
  echo "Lütfen geçerli bir sayı girin."
  exit 1
fi

# Betiğin belirtilen aralıkta çalışmasını sağlayan döngü
while true; do
  echo "Komut çalıştırılıyor: $(date)"

  # Komutları çalıştır
  systemctl stop stationd
  cd tracks
  sudo systemctl restart stationd

  echo "Komut çalıştırıldı: $(date)"

  # Belirtilen dakika kadar bekle ve döngüyü tekrar başlat
  sleep $((interval * 60))
done
