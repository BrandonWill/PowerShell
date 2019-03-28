$response = Invoke-WebRequest "http://demo.desktopcentral.com/api/1.0/patch/allsystems?=&" -Headers @{"Authorization"="954293BF-AF8D-4D24-9394-DE30C8C72E8E"}

$response.Content

$data = ConvertFrom-Json $response.Content 

ForEach ($server in $data.message_response.allsystems) {
    Write-Host "Name: $($server.resource_name) ID: $($server.resource_id) BootTime: $($server.agent_last_bootup_time)"
}
