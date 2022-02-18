
# DB

- DB設計
  1. 論理設計
    1. テーブル(エンティティ)設計
    2. 正規化
    3. ER図
  2. 物理設計
    1. テーブル定義
    2. インデックス定義
    3. サイジング
    4. 冗長設計(RAID)
    5. ファイル配置設計
  3. 実装設計
    1. パフォーマンスチューニング

# 論理設計

## 正規化

- 第1正規形: 非スカラ値の排除
- 第2正規形: 部分関数従属の排除
- 第3正規形: 推移的関数従属の排除
- ボイスーコッド形: 非キーからキーの関数従属の排除
- 第4正規形: 多値従属性の排除 = 関連エンティティ(中間テーブル)の作成
- 第5正規形: 多値従属性の排除 = 関連エンティティ(中間テーブル)の作成


## ER図

基本的には1対多。多対多は1対多の特殊形であり、`関連エンティティ`を作成することで解決可能


# 物理設計
## サイジング
## 冗長設計
## バックアップ設計

# MySQL

- admin: root

# SQL

## data types

- boolean: true / false
- integer: signed four-byte integer = 2 ** 32
  - bigint: signed two-byte integer = 2 ** 16
  - bigint: signed eight-byte integer = 2 ** 64
- character(n): fixed-length character string with blank padded
  - varchar(n): variable-length with limit
- date: calender date(year, month, day)
- json: textual JSON data
- money: currency amount
- text: variable-length character string without limit
- timestamp(p): date and time with or without time zone
- uuid: universally unique identifier
- xml: XML data


## constraint

- NOT NULL: 
- UNIQUE: 
- CHECK: limit value range(ex: value < 20, ['a', 'b'])
- PRIMARY KEY: NOT NULL + UNIQUE
- FOREIGN KEY: use other table's PRIMARY KEY

## index


## query

- SELECT
  SELECT columns FROM table;
  - DISTINCY: pick up data by only unique row
    SELECT DISTINCT (column) FROM table;
  - `WHERE`: specify row condition
    SELECT * FROM table WHERE condition;
  - AS: set alias
    SELECT (column) AS column_alias FROM table;
  - LIKE: search by string
    SELECT * FROM table WHERE column LIKE '%strng%';
  - IN: search by union
    SELECT * FROM table WHERE column IN (value1, value2, ...);
  - LIMIT: specify the number of response data
    SELECT * FROM table LIMIT num;
  - OFFSET: skip the number of data
    SELECT * FROM table OFFSET num;
  - `ORDER BY`: sort response data
    SELECT * FROM table ORDER BY column (ASC or DESC);
  - `JOIN`: join multiple tables
    - INNER JOIN
      SELECT * FROM table1 INNER JOIN table2 ON conditions;
  - `GROUP BY`: group rows
    SELECT * FROM table GROUP BY column1, column2, ...;
  - `HAVING`: it is like WHERE. it specifies condition after GROUP BY
    SELECT * FROM table GROUP BY column HAVING condition;

- CRUD
  - INSERT INTO: post values
    INSERT INTO table(column1, column2, ...)
    VALUES(value1, value2, ...);
  - UPDATE SET: update values
    UPDATE table SET column1=value1, column2=value2 WHERE condition;
  - DELETE FROM: delete value
    DELETE FROM table WHERE condition;

- functions
  - aggregate functions
    - AVG(): return the average value
    - COUNT(): return the number of value
    - MAX(): return the maximum value
    - MIN(): return the minimum value
    - SUM(): return the sum of all or distinct value



