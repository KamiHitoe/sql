
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

