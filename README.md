# アプリ名：MaSeen

## MaSeenの概要
#### 「トレーニングを始めたいのに待つ」というストレスを解消するアプリ
・フィットネスジムにある目当てのマシンの利用状況がリアルタイムでわかる  
・使いたいマシンの利用を予約してジムに向かうことができる

### URL
https://machine-watch.herokuapp.com/

### Basic認証
ID:yokokazkaz  
PASS:050607ky

### テストユーザー
**スタッフユーザー**  
アドレス:yokokaz@yokokaz.com  
PASS:050607ky  
  
**一般ユーザーA（ニックネーム：和樹）**  
アドレス:aaa@aaa.com  
PASS:123456ky  
  
**一般ユーザーB（ニックネーム：田中）**  
アドレス:bbb@bbb.com  
PASS:123456ky

## MaSeenの利用方法

## 目指した課題解決

**ペルソナ**  
男性&nbsp;27歳&nbsp;独身  
上場企業6年目&nbsp;営業系サラリーマン(土日休み)  
趣味：**筋トレ(週3回、1時間)**・読書・たまに飲み会  
時間をなるべく効率的に使いたい人    
近所の24時間営業のジムに通う  
平日は仕事が終わった後、夜に筋トレへ行く(夜の時間は利用者が多い)

**課題**




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
