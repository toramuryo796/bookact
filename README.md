# BookAct

## アプリケーション概要
読んだ本のアウトプットができるアプリです。  
本の紹介の他に、読み進める中で心に残ったフレーズや実践したい部分をメモのようにとることができるので、  
より本を効果的に読み進めることができます。  

## デプロイ済みURL


## 利用方法
- 本の登録
ユーザーがアプリに本を登録する仕組みです。  
本のタイトル、著者などの基本情報の入力が必須となっており、  
すでに登録済みの本(タイトル、著者が同一)の場合は、登録できません。  

- 本の紹介
1冊に登録される紹介文の数に制限はありませんが、  
ユーザーは１冊の本につき１つの紹介文しか登録できません。  
おすすめ度は、紹介文を登録したユーザーの平均値が表示されます。  

- 本のAct 
読んでいる中でメモしておきたいフレーズを残すことができます。  
その際、そのフレーズのポイントは何か、今後どのように自分の行動に落としていくかを記述します。  
これにより、ただ本を読むだけでなく、今後の行動に取り入れ安くなります。  

- 追記
下記、すでに登録しているユーザー情報となります。  
アプリを確認する際にご利用ください。  
  
userID : masuda    
email : masuda@gmail.com   
password : asd123  
  
userID : ryo  
email : ryo@gmail.com
password : asd123  

## 目指した課題解決
いい本を見つけたい    
本を購入する前にどのような本なのか把握したい   
本をより効果的に読みたい  
  
上記のような課題をまとめて解決することを目指しました。

## 要件定義
### 本の登録機能
  ~ 目的 ~  
  他ユーザーアプリ内で本を探し出せるようにする

  ~ 詳細 ~  
  タイトル、著者、出版社、発行日、カテゴリーの記入が必須です。

  ~ ストーリー ~  
  - ログインユーザーのみが本を登録することができます。
  - すでに登録されている本は重ねて登録することができません。
  - 検索欄から入力情報と登録済みの本のタイトルを照らし合わせ、合う本を一覧で表示させます。
  - 登録後は本の紹介登録ページに遷移します。

### 紹介機能
  ~ 目的 ~  
  他ユーザーが本の購入の際の参考にできる、紹介文としてアウトプットすることで本の理解を深める

  ~ 詳細 ~  
  紹介文のタイトル、紹介文、おすすめ度の記入が必須です。

  ~ ストーリー ~  
  - ログインユーザーのみ紹介文を登録できます。
  - 1冊の本に紹介文を登録できるユーザー数に制限はありません。
  - ユーザーは1冊の本につき1つの紹介文を登録できます。
  - おすすめ度は紹介文を記入したユーザーの平均値が表示されるようになります。

### Act機能
  ~ 目的 ~  
  本のフレーズをメモして、理解度を深めると共に今後の行動に取り入れる

  ~ 詳細 ~  
  sentence(フレーズ)、ページ、point、action(今後のアクションプラン)の記入が必須となります。

  ~ ストーリー ~  
  - ログインユーザーのみ登録できます。
  - 登録した内容は他ユーザーには閲覧できません。
  - 1冊の本にいくつもactionを登録できます。
  - 登録後はaction一覧ページに遷移します。

## ローカルでの動作方法
