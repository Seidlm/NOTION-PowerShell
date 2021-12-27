$NotionAPIKey = "Your API Key"

$Notionheaders = @{
    "Authorization"  = "Bearer $($NotionAPIKey)"
    "Content-type"   = "application/json"
    "Notion-Version" = "2021-08-16"
}

$DatabaseID = "your Database ID"

$JsonBody = @"
{
    "parent" :{"database_id":"$DatabaseID"},
     "properties":{
         "Name":{
            "title":[{
                "text":{"content": "This is a Test Task" }
            }
            ]
         },
         "Type": {
			"select": {
				"id": "3f806034-9c48-4519-871e-60c9c32d73d8"
			}
		},
        "Status": {
           "select": {
               "id": "ab01bfb1-1102-4701-af06-c3f33e74d398"
           }
       }
    }
}
"@

$Return = Invoke-RestMethod -Uri "https://api.notion.com/v1/pages" -Method POST -Headers $Notionheaders -Body $JsonBody
