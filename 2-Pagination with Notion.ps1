
#$NotionAPIKey="Your Secret"

$Notionheaders = @{
    "Authorization"  = "Bearer $($NotionAPIKey)"
    "Content-type"   = "application/json"
    "Notion-Version" = "2021-08-16"
}

$DatabaseID = "your Database ID"

$Result = Invoke-RestMethod -Uri "https://api.notion.com/v1/databases/$DatabaseID/query" -Method Post -Headers $Notionheaders

$Cursor = $False
$AllNotionTasks = @()

do {
    if (!($Cursor)) {
        $Result = Invoke-RestMethod -Uri "https://api.notion.com/v1/databases/$DatabaseID/query" -Method Post -Headers $Notionheaders
    }
    else {
        $JsonBody = @"
            {"start_cursor":"$Cursor"}
"@
        $Result = Invoke-RestMethod -Uri "https://api.notion.com/v1/databases/$DatabaseID/query" -Method Post -Headers $Notionheaders -Body $JsonBody
    }
    
    if ($Result.has_more) { $Cursor = $Result.next_cursor }

    $AllNotionTasks += $Result
    $AllNotionTasks.results.count
    
} until (!($Result.has_more))

$AllNotionTasks.results





$Result.results
