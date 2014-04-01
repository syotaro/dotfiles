
# Initial Setup

## Apps

- Excelのオプション
  - いじる
- DNSに8.8.8.8を加える
- 拡張子紐付け
  - md : Marked
- ATOK Passport
  - ATOKSync設定する
- one passwordのintegrationを有効化 →Alfredで1passwordと連携を有効化
- AirMail
  - GmailとGoogleAppsアカウントを有効化
    - 署名を追加
- Transmit
  - iCloud同期
- Chrome
  - RedmineTimeTracker
  - Vrome


## インターネットアカウント

- GoogleApps(個人用)
  - 基本何も有効にしない
- GoogleApps(仕事用)
  - 連絡先を同期
  - カレンダーを同期
- Twitter
  - 有効にし、連絡先をアップデートする
- Facebook
  - 連絡先
  - カレンダー
  - プロフィール写真をアップデート、を実行し、連絡先に情報をインポートする
- iCloud
  - メール(push通知が必要な場合有効にする)
  - 連絡先
  - リマインダー
  - メモ
  - サファリ
  - キーチェーン
  - フォト（必要に応じて）
  - 書類とデータ(但し、基本1Passwordのみ)

## 連絡先

- GoogleAppsの「連絡先」を直接読み書きできる
  - 仕事のプロジェクト関係者の連絡先情報はここで一元管理する(名刺情報など)
- iCloudに同期させるのは、iPhoneで参照したいもの
- 複数カードをリンクさせることも可能

##  カレンダー
  - GoogleApps(会社用)
    - 委任
      - 同僚のカレンダー(読み出しのみ)
      - 個人用GoogleAppsのカレンダー(読み/書き)
      - プロジェクトのCalDAV
  - Facebook
- 写真

# Maintenance

- GoogleAppsの「連絡先」に、よく連絡をとる人からインポート
  - ローカルの「連絡先」から編集する


- Excelが重く(セル文字列のコピペとかに異常に時間かかるようになったら)なったら
  - Excelを終了させる
  - mv $HOME/Library/Preferences/com.microsoft.office.plist /tmp


## キーショートカット設定

## Global

Shift  + Command + V 履歴からペースト
Option + V           書式なしペースト

### Finder

(Fileを選択した状態で)Ctrl + Command + V ファイルとしてペースト(Require PasteAsFile.app)
Command + U デュアルモード
