#region init

    # init
    $rootPath = $PSScriptRoot
    $shipsIdList = @()
    $shipsTable  = @()
    $uri         = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1"
    $baseuri     = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no="

    #get list of attributes
    $attributesCSV = Import-Csv -Path $PSScriptRoot"\attributes.csv"
    $attributes    = $attributesCSV.Field

    #add field descriptions to $shipsTable
    $fieldDescriptions = & ($rootPath+"\fieldDescriptions.ps1")
    $shipsTable       += $fieldDescriptions


#endregion init


#region functions

    function extractFieldValue {
        param(
            $response,
            $field
        )
        $value = $response.data.PSObject.Properties.Value.$field
        return $value
    }

    function sendFieldRequest {
        param(
            $shipID,
            $field
        )

        #build request string
        #example: https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=3248404240&fields=default_profile.battle_level_range_min
        $URI      = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=$shipID&fields=$field"
        $response = Invoke-RestMethod -Uri $URI -Method Get
        return $response
    }

    function exportShipTable{
        Param(
            $rootPath,
            $shipsTable
        )

        # Determine the path and file name to save the CSV
        $outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath "ships.csv"

        # Export the table to a CSV file in the script's directory
        $shipsTable | Export-Csv -Path $outputFilePath -NoTypeInformation
    }


#endregion functions


#region build ship list

    #get meta info 
    $response =  Invoke-RestMethod -Uri $uri -Method Get
    $meta     =  $response.meta 

    #get page count
    $shiptotal = $meta.total
    $pagesize  = $shiptotal / 100
    $pagecount = [math]::Ceiling($pagesize) + 1

    # For loop that runs based on the value of $loopSize
    for ($i = 1; $i -lt $pagecount; $i++) {
        
        "getting page " +$i

        #set page number
        $uripaged = $baseuri + $i
        
        #request ids and add to array
        $response     = Invoke-RestMethod -Uri $uripaged -Method Get
        $shipids      = extractFieldValue -response $response -field "ship_id"
        $shipsIdList += $shipids
    }

#endregion


#region build ship table

    #loop through shipsIdList
    foreach ($shipID in $shipsIdList) {
        "processing $shipID"

        #init $shipObject
        $response = sendFieldRequest -shipID $shipID -field "description"

        $description =  extractFieldValue -response $response -field "description"
        $shipObject  = [PSCustomObject]@{
            description = $description
        }

        #loop through attributes
        foreach ($attribute in $attributes) {
            "fetching attribute: "+$attribute+": "
            #generate a new request for the attribute
            $response = sendFieldRequest -shipID $shipID -field $attribute

            #get attribute value
            $value = extractFieldValue -response $response -field $attribute
            Write-Host -NoNewline $value

            # Add a new key-value pair using Add-Member
            $shipObject | Add-Member -MemberType NoteProperty -Name $attribute -Value $value -ErrorAction SilentlyContinue
        }

        #display final ship object
        $shipObject

        # Add the ship object to the array
        $shipsTable += $shipObject
        exportShipTable -rootPath $rootPath -shipsTable $shipsTable
    }

#endregion



<#


$shipsTable | Format-Table -AutoSize

# Determine the path to save the CSV
$outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath "ships.csv"

# Export the table to a CSV file in the script's directory
$shipsTable | Export-Csv -Path $outputFilePath -NoTypeInformation


            # Create a PSCustomObject for each ship with relevant properties
            $shipObject = [PSCustomObject]@{
                ShipID            = $ship.ship_id
                Name              = $ship.name
                Nation            = $ship.nation
                Type              = $ship.type
                Tier              = $ship.tier
                Hitpoints         = $ship.default_profile.armour.health
                TorpReloadTimeSec = $ship.default_profile.torpedoes.reload_time
                TorpFiringRange   = $ship.default_profile.torpedoes.distance
                NumMainTurrets    = $ship.default_profile.hull.artillery_barrels
                FiringRange       = $ship.default_profile.fire_control.distance
                ReloadTimesec     = $ship.default_profile.atbas.slots.shot_delay
                ShellType         = $ship.default_profile.atbas.slots.type
            }

#>




