# README

# 概要

このアプリはログイン機能を設けた掲示板アプリです。沖縄について匿名で話し合うことができ、各ユーザーは自分で話したい内容についてルームを作成できます。他のユーザーは検索機能を使い作成されたユーザーのルームに入ります。また、話が進み自分の気持ちを外部に伝えたい場合は用意されたリンクに遷移し、問い合わせフォームを通して自分の意見を伝えることができます。

# 制作背景(意図)
沖縄について雑談できる場を提供するのが一番の目的です。また、掲示板で議論された内容を外部の問い合わせフォームで伝えることで掲示板の枠を超えた議論の場も提供できるようにしました。その際他のユーザーと議論することにより内容が洗練されたものを送ることでき、外部の人間の目に留まりやすくなることを目標にしています。

# 本番環境
https://okinawa-forum.herokuapp.com/

ログイン情報 (テスト用)  

・Eメール: samplesan@gmail.com  
・パスワード: sample777

# DEMO
### トップページ
https://gyazo.com/8e07682dc92345d36b715de5c46588df  

トップページです。ヘッダーにログイン機能があります。ユーザーが作成したルーム情報(ポスト)が一覧表示されたおり、各ルームの詳細ページに遷移できます。また、ルームの検索機能が画面中央にあり、ポストの名前または本文で使われる単語があれば検索結果を一覧表示します。


### トップページ(ログイン済)
https://gyazo.com/0ff58d6e8716d93c1b9f41fdb25f281f

ログイン状態のトップページです。ログイン状態のみ各ルームに入ることができ、またルームやポストの作成、検索が可能です。また、ポスト作成のためのボタンが右下固定されており、ここからポスト作成がめんに遷移します。

### 新規登録画面
https://gyazo.com/b8a3a3424a4b724ad91eaa3b4bc781f2  

新規登録画面です。ニックネーム、メールアドレス、パスワード(確認用含む)を入力し、入力ミスが確認された場合エラー文が表示される。

### ログイン画面
https://gyazo.com/7e587028a51a68d59e9a969d8fb39826  

ログイン画面です。メールアドレスとパスワードを入力し、入力ミスが確認された場合エラー文が表示されます。

### ポスト作成画面
https://gyazo.com/c7e329687a8086e43f35b253a5cd633c  

ポスト作成画面です。ルームの詳細をポストとして投稿し、トップページに一覧表示させます。この機能はログインユーザーのみが使用でき、ルームの権限はポストを作成したユーザーに限定されます。

### ポスト、ルーム詳細画面
https://gyazo.com/3b95fa937de95189c69f493514ed56b5  

ポスト、ルーム詳細画面です。ポストの作成者はこの画面でルームを開くことができ、すでに開かれている場合はルームへ入るボタンが表示されます。ログイン状態であっても他のユーザーはルームの開設に関わることはできません。

### ルーム、掲示板画面
https://gyazo.com/fb41cd05b311c40cf0cc4ad79b334b60  

ルーム、掲示板画面です。ヘッダーにはルームの名前が表示され、送信されたメッセージが一覧表示されています。メッセージ送信機能は右下に固定されており、隣のメモを開くボタンからメモ機能へ新しいウィンドウを開き遷移できます。

### メモ、url遷移画面
https://gyazo.com/8496546c09f3fab058182761d345753c  

メモ、url遷移画面です。掲示板で話した内容をまとめるなど自由な用途でメモ機能を活用できます。さらに、プルダウンで表示されたSNSサービスまたは沖縄の公的機関の問い合わせフォームに遷移でき、自身でまとめた内容を伝えられるようにします。

### 検索機能
https://gyazo.com/1f9a892f449b8e272016fcb0a452ec5f  

ルームの詳細を持つポストを検索できます。ポストのタイトル、内容に含まれる文字が検索された場合、条件に一致したポストを一覧表示します。

# 工夫したポイント

・オプションでプルダウンに各SNSと沖縄県の役所の問い合わせフォームに遷移できる記述を埋め込みました。javascriptを用いてクリックさせたプルダウン内のurl先に遷移させることができます。  

・actioncableを使い双方向のチャット機能を導入しました。  

・掲示板機能にユーザー認証機能をつけることで従来の掲示板よりも混み合った話題がしやすくなります。

# 使用技術

### バックエンド
Ruby, Ruby on Rails

### フロントエンド
Html, Css, Javascript, Ajax

### データベース
Mysql

### 本番環境
Heroku

### ソース管理
Github, GithubDesktop

### テスト
RSpec

### エディタ
VSCode  

### 課題や今後実装したい機能  

・javascriptを用いてエラー文の非同期を実装したものの２回目のイベントが発生しない問題に直面し、改善中です。  

・全体的なレイアウトを随時改善したいと思います。

# DB設計

## User

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|email        |string      |null: false                      |
|password     |string      |null: false                      |
|nickname     |string      |null: false                      |

## Associations

has_many :posts
has_many :messages

## Post

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|name         |string      |null: false                      |
|content      |text        |null: false                      |
|user         |references  |null: false, foreign_key: true   |

## Associations

has_one :room
belongs_to :user

## Room

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|name         |string      |null: false                      |
|post         |references  |null: false, foreign_key: true   |

## Associations

belongs_to :post
has_many :messages
has_one :memo

## Message

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|content      |string      |null: false                      |
|user         |references  |null: false, foreign_key: true   |
|room         |references  |null: false, foreign_key: true   |

## Associations

belongs_to :user
belongs_to :room

## Memo

|column       |type        |options                          |
|-------------|------------|---------------------------------|
|content      |string      |                                 |
|room         |references  |null: false, foreign_key: true   |


## Associations

belongs_to :room

# githubクローン
https://github.com/tosumaso/okinawa_forum.git
