# nginx_docker

## 前準備
あらかじめポートを解放しておいてください
```
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
```

## ビルド
```
sudo docker build -t nimg:0.1 .
```

## foregroundで実行
```
sudo docker run --rm  -i -p 80:80 -v /vagrant/http:/var/www -t nimg:0.1  /bin/bash
```

## backgroundで実行
```
sudo docker run -d -i -p 80:80 -v /vagrant/http:/var/www -t nimg:0.1
```

## 削除
### 実行中の全てのコンテナを削除
```
sudo docker rm -f  $(sudo docker ps -a -q)
```

### 全てのイメージを削除
```
sudo docker rmi -f $(sudo docker images -q)
```



