# RSSフィード投稿用Powershellスクリプト
## 仕様
- QiitaのtagをキーワードとしてRSSフィードを取得し、Markdown形式に変換して指定件数分をMSTeamsに出力します。
## 動確環境
- Windows 10 Enterprise
- Powershell 5.1
## 実行前準備
- 以下前準備をしないと動作しません。
1. MS TeamsIncoming Webhook
1. /ini/congig.iniを作成する。
    - keyword=キーワード（Qiitaのtagに相当する部分）
    - startmsg=スタートメッセージ
    - devuri=デバッグ用のWebhook URI
    - prouri=本番用のWebhook URI
    - successmsg=投稿に成功した場合のメッセージ
    - failedmsg=投稿に失敗した場合のメッセージ
