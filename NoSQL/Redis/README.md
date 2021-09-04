
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

DBの削除
```js
db.dropDatabase();
```

collectionの一覧を確認
```js
show collecitons;
```

collectionの作成
```js
db.createColleciton("colleciton");
```

collectionの名前変更
```js
db."collection".renameCollection("collection");
```

collectionの削除
```js
db."colleciton".drop()
```

documentの全件SELECT
```js
db."collection".find({});
```

document数(rows)の確認
```js
db."collection".count();
```

documentの全件削除
```js
db."collection".remove({});
```

条件の記号
```
>= = $gte
> = $gt
<= = $lte
< = $lt
= = $eq
<> = $ne
```

列方向検索
```js
db."collection".distinct("field");
```

SELECT条件
```js
// AND
db."collection".find({field1: value1, field2: value2});

// OR
db."collection".find({$or: [{field1: value1}, {field2: value2}]});

// IN
db."collection".find({field: {%in: [value1, value2]}});

// field単位でのIN
db."collection".find({field: {$exists: true}});

// 特定field
db."collection".find({}, {field1: true, field2: true});

// ORDER BY
db."collection".find({}).sort({field: 1});

// ORDER BY DESC
db."collection".find({}).sort({field: -1});

// LIMIT
db."collection".find({}).limit(n);

// OFFSET
db."collection".find({}).skip(n);
```

UPDATE
```js
// 条件に合致した最初の一件だけ
db."collection".update({field: value}, {$set: {field: update_value}});

// 条件に合致した全てのdocument
db."collection".update(
    {field: value},
    {$set: {field: update_value}},
    {multi: true}
);

// 四則演算
// 和算
db."collection".update({field: value}, {$inc: {field: number}});

// 乗算
db."collection".update({field: value}, {$mul: {field: number}});

// ALTER
db."collection".update(
    {field: value},
    {$rename: {field: rename_field}}
);

// fieldの追加
db."collection".update({field: value}, {$set: {field: value}});

// fieldの削除
db."collection".update({field: value}, {$unset: {field: ""}});

// UPDATE OR INSERT
db."collection".update(
    {field: value},
    {$set: {field: value}},
    {upsert: true}
);
```

DELETE
```js
db."collection".remove({field: value});
```

INDEX (順序の索引を設ける)
```js
// INDEXの取得
db."collection".getIndexes();

// INDEXの作成 1 = 昇順, -1 = 降順
db."collection".createIndex({field: 1});

// INDEXの削除
db."collection".dropIndex("indexName");

// UNIQUE 制約
db."collection".createIndex({field: 1}, {unique: true});
```

backupとrestore
```js
// backup fileの作成
mongodump -d "db"

// backup fileからrestore
mongorestore --drop // 同一dbの上書き
```

