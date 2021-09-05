
# MongoDB

## Glossary

mongoDBはスキーマレスである。つまり、コレクションごとに型がないので、型チェックなしにドキュメントを挿入することが可能

```js
glossary: {
    database: database,
    table: collection,
    record: document,
    column: field,
}
```

## Syntax

DB一覧を確認
```js
show databases;
```

現在のDBを確認
```js
db.stats();
```

DBの作成、接続
```js
use "db";
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

documentの挿入
```js
db."collection".insert({key1: "value1", key2: "value2"});
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

