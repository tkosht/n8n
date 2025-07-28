# n8n
n8n self host repository


# setup

```bash
cp .env.example .env
```

## run bin/certs.sh

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


## edit .env

`N8N_HOST`, `N8N_ENCRYPTION_KEY`, `SSL_EMAIL` を変更


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

