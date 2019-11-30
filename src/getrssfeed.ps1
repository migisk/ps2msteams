# 検索キーワードをもとにRSSフィードを取得し、指定件数をTeamsに投稿する。

# ini読み込み
$lines = Get-Content ".\ini\config.ini"
$ini = @{}
foreach ($line in $lines) {
    if ($line -match "^$") {
        continue
    } elseif ($line -match "^;") {
        continue
    } else {
        $param = $line.split("=", 2)
        $ini.add($param[0], $param[1])
    }
}

# 検索キーワード
$keyword = $ini["keyword"]

# RSSフィードURL
$url = "https://qiita.com/tags/" + $keyword + "/feed.atom"

# RSSフィード取得
Write-Host $ini["startmsg"]
$res = Invoke-WebRequest -Uri $url
[XML]$f = $res.Content

# 初期化、タイトル行出力
$titleline = "**"
$titleline += [string](Get-Date -format "yyyy/MM/dd HH:mm:ss")
$titleline += " Qiita RSSフィード (Tags:" + $keyword
$titleline += ")**"
$text = @()
$text += $titleline

# $limit件のみ抽出、Markdown出力
$limit = 5
for ($i=0; $i -lt $limit; $i++) {
    $text += "<br>"
    $text += "- [" + $f.feed.entry[$i].title + "](" + $f.feed.entry[$i].url + ")"
}

# JSONに変換
$body = @{
    text = [string]$text
}
$body = ConvertTo-JSON $body
$body = [Text.Encoding]::UTF8.GetBytes($body)

# IncomingWebhook URI
# Test用
#$URI = $ini["devuri"]
# 本番
$URI = $ini["prouri"]

# Teams投稿
$result = Invoke-RestMethod -uri $URI -Method Post -body $body -ContentType 'application/json'
if ($result -eq 1) {
    Write-Host $ini["successmsg"]
} else {
    Write-Host $ini["failedmsg"]
}
