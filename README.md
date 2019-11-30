# RSSフィード投稿用Powershellスクリプト
## Description
- QiitaのtagをキーワードとしてRSSフィードを取得し、Markdown形式に変換して指定件数分をMSTeamsに出力する。
- 動確環境
    - Windows 10 Enterprise
    - Powershell 5.1
## Install
- 以下前準備をしないと動作しない。
1. MS TeamsIncoming Webhookを構成してURIをメモっておく。
1. /ini/config.iniを作成する。
    - keyword=キーワード（Qiitaのtagに相当する部分）
    - startmsg=スタートメッセージ
    - devuri=デバッグ用のWebhook URI
    - prouri=本番用のWebhook URI
    - successmsg=投稿に成功した場合のメッセージ
    - failedmsg=投稿に失敗した場合のメッセージ
## Author
[migisk](https://github.com/migisk)