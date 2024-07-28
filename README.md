<h1 align="center">İstasyon Tekrar Başlatma</h1>

```
wget -O tekrarbaslat.sh https://raw.githubusercontent.com/ferdiyalcin/Airchains_/main/tekrarbaslat.sh && chmod +x tekrarbaslat.sh && ./tekrarbaslat.sh
```

<h1 align="center">Tracks Güncelleme</h1>

```console
systemctl stop stationd
cd tracks
git stash
git pull
go run cmd/main.go rollback
go run cmd/main.go rollback
go run cmd/main.go rollback
systemctl start stationd
journalctl -u stationd -f --no-hostname -o cat
```

<!--[Buradan kopyala](https://github.com/ferdiyalcin/Airchains_/blob/main/tekrarbaslat.sh) -->

<h1 align="center">Rollback</h1>

```console
screen -S rollback
nano auto_rollback.sh
```


```
#!/bin/bash

read -p "Lütfen rollback aralığını saniye cinsinden girin: " Rollback_interval

echo "Başlamadan önce 5 dakika bekleniyor..."
sleep 300

#Sonsuz döngü içinde çalışacak
while true; do
    echo "Servis durduruluyor..."
    systemctl stop stationd
    sleep 2
    cd tracks
    sleep 2
    echo "Rollback çalıştırılıyor..."
    go run cmd/main.go rollback
    sleep 2
    go run cmd/main.go rollback
    sleep 2
    go run cmd/main.go rollback
    sleep 2
    echo "Servis başlatılıyor..."
    sudo systemctl restart stationd
    echo "Başarıyla rollback atıldı."
    sleep $Rollback_interval
done
```

```console
chmod +x auto_rollback.sh
./auto_rollback.sh
```

<h1 align="center">Temp Dosyalarını Silme</h1>

>Bu komut, /tmp dizininde son 1 saat içinde değiştirilmeyen dosyaları silecek ve son 1 saat içinde değiştirilen dosyaları koruyacaktır.

```
find /tmp -type f ! -path "/tmp/screen*" -mmin +60 -exec rm -f {} \;
```
> [Metin hoca](https://x.com/0xmtnslk/status/1813667055599784124) tarafından paylaşılmış, benim tarafımdan düzenlenmiştir.
