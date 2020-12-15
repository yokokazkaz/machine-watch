![maseen-top](https://user-images.githubusercontent.com/71754586/102206230-9c0ba400-3f0f-11eb-9b11-43990a1ba87e.gif)

# アプリ名：MaSeen(読み：マシーン)

## MaSeenの概要
#### 「トレーニングを待たされる」というストレスを解消するアプリ
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
  
### 一般ユーザー
**①：ログイン**  
右上の「ログイン」をクリックしてログイン画面に遷移。情報を入力してログイン  
  
  
**②：マシン一覧の確認**  
トップページにある「マシン一覧」でジムにあるマシン種類、利用状況が閲覧可能  
  
※確認できること  
・マシンの利用状況「空」or「満」  
・現在利用者の終了予定時刻（「満」の場合）  
・次回予約者の有無（「満」の場合）  
  
  
**③：マシンの予約**  
・次の利用を予約したいマシンを予約する  
※(利用状況「満」かつ「予約者無し」のマシン限定)  
  
・予約したいマシンの写真をクリックしマシンの詳細画面へ遷移  
「予約画面に進む」をクリックし、次の「予約する」をクリック  
※自分でした予約を取り消すことも可能  
  
[一般ユーザー操作demo](https://i.gyazo.com/80312fa5d6ae7bebea6a8bb41dc80811.mp4)
  
### スタッフユーザー
**①マシンの新規登録**  
右上の「新規マシン登録」をクリックして登録画面に遷移。情報を入力してマシンを新規登録  
  
  
**②マシン情報の編集・削除**  
「情報の編集」をクリックしてマシンの情報編集ページへ遷移、編集等が可能  
「削除」をクリックしてマシンを一覧から削除  
  
  
**③利用状況の切り替え**  
マシンの編集ページにある「マシンの空き状況」プルダウンで変更  
マシンの利用が始まったら「空」→「満」へ切り替え  
マシンの利用者が利用を終了したら「満」→「空」へ切り替え  
  
[スタッフユーザーdemo](https://i.gyazo.com/250961434db811b6b27ea32a4750596c.mp4)

## 目指した課題解決
**ペルソナ**  
男性&nbsp;27歳&nbsp;独身  
上場企業6年目&nbsp;営業系サラリーマン(土日休み)  
趣味：**筋トレ(週3回、1時間)**・読書・たまに飲み会  
時間をなるべく効率的に使いたい人  
近所の24時間営業のジムに通う  
平日は仕事が終わった後、夜に筋トレへ行く(夜の時間は利用者が多い)  
  
**課題①：ジムにあるマシン毎の利用状況をリアルタイムに知りたい**  
  ●Why?  
  自分のその日使いたいマシンが空いているか否か店に行かないとわからない  
  マシンが使える時間に合わせてジムに行きたい  
    
  ●解決する機能  
  店舗にあるマシンの利用状況、空く時間がWEBで確認できる機能  
    
**課題②：利用したいマシンは来店してから即、確実に使いたい**  
●Why?  
準備をしてジムに行き、目当てのマシンが空いていない  
トレーニングを始めるのに20分待機、これがとてもストレスに感じる  

●解決する機能  
マシンが空く時間を確認し、次の利用をWEBで予約できる機能

## 機能の要件定義





## データベース設計

### ER図
[![Image from Gyazo](https://i.gyazo.com/931958d3638a6ed7dfa1821029d564f9.png)](https://gyazo.com/931958d3638a6ed7dfa1821029d564f9)


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

## バージョン・パッケージ

[![Image from Gyazo](https://i.gyazo.com/bf57e48b751c34f959fdc3f6c0bc0d24.png)](https://gyazo.com/bf57e48b751c34f959fdc3f6c0bc0d24)  
  
[![Image from Gyazo](https://i.gyazo.com/306fca19b947c97820121f866bf6eabd.png)](https://gyazo.com/306fca19b947c97820121f866bf6eabd)