## プロジェクト概要

このプロジェクトは、Railsで作成する接客メモ・顧客対応管理アプリです。
目的は、顧客情報、接客記録、次回対応日、対応状況を管理できるようにすることです。

## 使用技術

- Ruby 3.4.9
- Rails 8.1.3
- SQLite
- HTML / CSS
- TailwindCSS
- JavaScript

## 作業ルール
- 仕様判断で迷ったら docs/product-requirements.md を優先する
- 受けた質問に対しては初学者にも理解できるように、簡潔に説明する
- 大きな変更を一度に行わない
- 不要なGemを追加しない
- セキュリティ上危険な実装を避ける
- 変更したファイルと変更理由を最後にまとめる

## 実行コマンド

このプロジェクトでは、テストにRSpecを使用する。
Rails標準のMinitestではなく、基本的にRSpecを優先する。

- 全テスト実行: `bin/rspec`
- 特定ファイルのテスト実行: `bin/rspec spec/対象ファイル_spec.rb`
- モデルスペック実行: `bin/rspec spec/models`
- システムスペック実行: `bin/rspec spec/system`
- データベース準備: `bin/rails db:test:prepare`
- サーバー起動: `bin/dev`
