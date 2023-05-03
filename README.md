# アプリケーション名
ZUBORAMESHI

# アプリケーション概要
自分で作った料理を投稿したり他の人が作った料理を見ることができる。

# URL
https://zuborameshi.onrender.com/

# テスト用アカウント
・BASIC認証パスワード：2222  
・BASIC認証ID：admin  
・メールアドレス：test@mail  
・パスワード：123456  

# 利用方法 
### 自分が作った料理を投稿する
------------------------
1.トップページでユーザー新規登録を行う。  
2.「料理を投稿する」ボタンから料理の投稿ページに遷移し、情報を入力して料理を投稿する

### 他の人が作った料理を確認する
-------------------------
1.トップページに投稿された料理の名前と画像と簡単な説明の一覧を表示する
2.料理の名前か画像をクリックするとその料理の詳細ページに遷移し、詳細な情報を見ることができる

# アプリケーションを作った背景
前職の後輩と自炊をしたいという話をしていたが、なかなか出来ない理由が「めんどくさい」や「時間がない」というものだった。また、自炊をしても同じようなものばかり作ってしまいレパートリーが少ないという問題もあった。簡単に作れる料理を投稿できるアプリがあれば、自炊をするモチベーションを上げ、かつ時間がない時でも作れる料理のレパートリーを増やすことが出来ると思い、料理投稿アプリを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1u0EXQl12XuYJnUeQFr_xY8nUlE4XUfIeNBUffPOqTC0/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
1つの料理に対して食材、調味料、手順を複数投稿できる機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/3a8dd0540a1bee9c85d04db19370027b.png)](https://gyazo.com/3a8dd0540a1bee9c85d04db19370027b)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/969d0f797de066afc72b570cdb65817e.png)](https://gyazo.com/969d0f797de066afc72b570cdb65817e)

# 開発環境
・フロントエンド      HTML,CSS,JavaScript
・バックエンド       Ruby
・インフラ           MacBook Air(macOS Ventura 13.0)
・テスト             Rspec
・テキストエディタ    Visual Studio Code
・タスク管理         GitHub 

# ローカルでの動作方法
以下のコマンドを順に実行。
% git clone https://github.com/onitsuyo/zuborameshi
% cd zuborameshi
% bundle install
% yarn install

# 工夫したポイント
材料、調味料、手順は任意の数投稿できる機能を実装したかったので、料理のテーブルと多対多の関係にし、
それぞれに中間テーブルを作成した。


