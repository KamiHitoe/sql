
# Redis

## Feature
インメモリ型のDBのため高速。その代わり容量制限が厳しいので、リアルタイム処理やログ用として用いられる。データの永続化のために定期的にディスクにデータを書き出す。サーバとクライアントに分けて接続する


## Glossary

RedisはKVS(Key Value Store)型のNoSQL。Valueに複雑なデータ構造を保持できる

### データ型

- String: string, number
- List: 時系列データ等
- Set: 集合(unique)
- Sorted Set: Set with weight
- Hash: Key, Value

## Syntax

サーバを起動・中止
```
redis-server
Ctrl + c
```

クライアントから接続・終了・保存・保存して終了
```
redis-cli
exit
bgsave
shutdown
```

DBの接続(0 - 15まで存在する)
```
select "num"
```

String型の挿入・検索
```
set key value
get key

# 複数
mset key1 value1 key2 value2
mget key1 value1 key2 value2

# Integerの操作
incr int # ++
decr int # --
```



