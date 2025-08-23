
$URI      = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=3248404240"
$response = Invoke-RestMethod -Uri $URI -Method Get 


#$response.data.psobject.Properties.value.default_profile.artillery.GetType().name

#if property is not object, add it to the shipObject
$shipData = $response.data.psobject.Properties.value
    
function Iterate-PSCustomObject {
    param (
        [Parameter(Mandatory = $true)]
        [PSCustomObject]$Object,
        [string]$Prefix = ""
    )

    foreach ($property in $Object.PSObject.Properties) {
        $name = if ($Prefix) { "$Prefix.$($property.Name)" } else { $property.Name }
        $value = $property.Value

        if ($value -is [PSCustomObject]) {
            # Recursively call the function for nested objects
            Iterate-PSCustomObject -Object $value -Prefix $name
        } else {
            Write-Host $name": " $value
        }
    }
}

# Call the function with the top-level object
Iterate-PSCustomObject -Object $shipData
