
$NotionAPIKey="Your Secret"

$Notionheaders = @{
    "Authorization"  = "Bearer $($NotionAPIKey)"
    "Content-type"   = "application/json"
    "Notion-Version" = "2021-08-16"
}

$DatabaseID="Your Database ID"

$Result = Invoke-RestMethod -Uri "https://api.notion.com/v1/databases/$DatabaseID/query" -Method Post -Headers $Notionheaders

$Result.results