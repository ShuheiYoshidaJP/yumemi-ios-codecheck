# 株式会社ゆめみ iOS エンジニアコードチェック課題

## 動作確認

<img src="https://user-images.githubusercontent.com/62702170/209234870-38951b9a-b9cd-41b7-b289-93519e6ef799.gif" width="300">

## API

リクエスト情報の管理→```GithubAPIRequest```

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/API/GithubAPI.swift#L16

リクエスト＆取得データのデコード→```APIProvider```

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/API/APIProvider.swift#L16

データ取得部分を```RxSession```でラップ→テストしやすいように

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/API/RxSession.swift#L16

リクエストのテスト

モックの作成

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheckTests/API/URLSessionMock.swift#L14


レスポンスでエラーが返ってくる場合のテスト

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheckTests/API/APIProviderTest.swift#L23-L37

## リポジトリ一覧画面

MainViewModel

テキスト入力→リポジトリ情報出力

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/ViewModel/MainViewModel.swift#L45-L64

1. テキスト入力して1秒待つ
2. テキストのバリデータ（0文字・1文字ははじく）
3. リポジトリ一覧情報取得&出力

MainViewController

TableViewをスクロールするとキーボードをしまう

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/View/MainViewController.swift#L22

## リポジトリ詳細画面

画面遷移部分

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/View/MainViewController.swift#L54-L58

ViewはXibで作成

Xibを呼び出す拡張機能を作成

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck/Extension/UIViewControllerExtension.swift#L12-L17

## ソースコードの管理

SwiftLintを使用

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/iOSEngineerCodeCheck.xcodeproj/project.pbxproj#L424

ビルド時に起動

## 使用ライブラリ

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/Podfile#L7-L9

CocoaPodを使用

```
make install_pod
```

```install_pod```の詳細

https://github.com/ShuheiYoshidaJP/yumemi-ios-codecheck/blob/280e83fcd5dd53366789115abd940f2c78cef1bd/Makefile#L13-L14


## コミットメッセージ

* fix：バグ修正
* add：新規（ファイル）機能追加
* update：機能修正（バグではない）
* change：仕様変更
* disable：無効化（コメントアウト等）
* remove：削除（ファイル）
* upgrade：バージョンアップ

[参考](https://qiita.com/itosho/items/9565c6ad2ffc24c09364)


<details>
  <summary>課題の内容</summary>

## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.gif)

### 環境

- IDE：基本最新の安定版（本概要更新時点では Xcode 14.1）
- Swift：基本最新の安定版（本概要更新時点では Swift 5.7）
- 開発ターゲット：基本最新の安定版（本概要更新時点では iOS 16.1）
- サードパーティーライブラリーの利用：オープンソースのものに限り制限しない

### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示

## 課題取り組み方法

Issues を確認した上、本プロジェクトを [**Duplicate** してください](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)（Fork しないようにしてください。必要ならプライベートリポジトリーにしても大丈夫です）。今後のコミットは全てご自身のリポジトリーで行ってください。

コードチェックの課題 Issue は全て [`課題`](https://github.com/yumemi/ios-engineer-codecheck/milestone/1) Milestone がついており、難易度に応じて Label が [`初級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A初級+milestone%3A課題)、[`中級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A中級+milestone%3A課題+) と [`ボーナス`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3Aボーナス+milestone%3A課題+) に分けられています。課題の必須／選択は下記の表とします：

|   | 初級 | 中級 | ボーナス
|--:|:--:|:--:|:--:|
| 新卒／未経験者 | 必須 | 選択 | 選択 |
| 中途／経験者 | 必須 | 必須 | 選択 |


課題 Issueをご自身のリポジトリーにコピーするGitHub Actionsをご用意しております。  
[こちらのWorkflow](./.github/workflows/copy-issues.yml)を[手動でトリガーする](https://docs.github.com/ja/actions/managing-workflow-runs/manually-running-a-workflow)ことでコピーできますのでご活用下さい。

課題が完成したら、リポジトリーのアドレスを教えてください。

## 参考記事

提出された課題の評価ポイントに関しては、[こちらの記事](https://qiita.com/lovee/items/d76c68341ec3e7beb611)に詳しく書かれてありますので、ぜひご覧ください。
ライブラリの利用に関しては [こちらの記事](https://qiita.com/ykws/items/b951a2e24ca85013e722)も参照ください。

  
</details>
