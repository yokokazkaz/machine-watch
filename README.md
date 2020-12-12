# アプリ名：MaSeen

## MaSeenの概要
#### 「トレーニングを始めたいのに待つ」というストレスを解消するアプリ
・フィットネスジムにある目当てのマシンの利用状況がリアルタイムでわかる  
・使いたいマシンの利用を予約してジムに向かうことができる

#### URL
https://machine-watch.herokuapp.com/

#### Basic認証
ID:yokokazkaz
PASS:050607ky

## テーブル設計

### user テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |


#### Association

- has_many :machines

### machine テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| detail           | text       | null: false                    |
| status_id        | integer    | null: false                    |
| time             | string     |                                |
| subscriber       | string     |                                |
| user             | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to_active_hash :status_id
