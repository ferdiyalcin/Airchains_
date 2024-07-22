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

<!--[Buradan kopyala](https://github.com/ferdiyalcin/Airchains_/blob/main/tekrarbaslat.sh)
