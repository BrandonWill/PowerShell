#https://www.manageengine.com/products/desktop-central/api/gettingstarted.html

$pagelimit = 25
$page = 1
$readMore = $true
$apiKey = "954293BF-AF8D-4D24-9394-DE30C8C72E8E"

do {
    

    $apiURL = "http://demo.desktopcentral.com/api/1.0/patch/allsystems?=&pagelimit=$($pagelimit)&page=$($page)"

    $response = Invoke-WebRequest $apiURL -Headers @{"Authorization"="$($apiKey)"}

    #$response.Content

    $data = ConvertFrom-Json $response.Content

    Write-Host "------ Page #$($page) ------"
    ForEach ($server in $data.message_response.allsystems) {
        Write-Host "Name: $($server.resource_name) ID: $($server.resource_id) BootTime: $($server.agent_last_bootup_time)"
    }

    $totalRead = $data[0].message_response.limit * $data[0].message_response.page

    if ($totalRead -ige $data[0].message_response.total) {
        $readMore = $false
    } else {
        $page++
    }

} while ($readMore -eq $true)
