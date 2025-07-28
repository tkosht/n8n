# n8n
n8n self host repository


# setup

```bash
cp .env.example .env
```

## edit .env

`N8N_HOST`, `N8N_ENCRYPTION_KEY`, `SSL_EMAIL` を変更


## run bin/certs.sh

`N8N_HOST` (ローカルIP アドレス可) を設定していないと正しく動作しません。


```bash
make cert
```

以下のように出力されれば OK です。

```bash
$ make cert
Certificate request self-signature ok
subject=CN = xxx.xxx.xxx.xxx
$
```

.certs/ca.crt (作成したルート証明書) を利用するブラウザのPCにて、「信頼されたルート証明機関」としてインポートする
Windows では、`mmc` コマンドでインポートできます


# その他タスク

必要に応じて実行してください

## コンテナ起動

```bash
make
```

or `make up`


## コンテナ停止

```bash
make down
```


## コンテナ削除

```bash
make clean-containers
```

## クリーンアップ

```bash
make clean
```

※ cert 情報は削除されません


## cert 情報の削除

```bash
make clean-cert
```

