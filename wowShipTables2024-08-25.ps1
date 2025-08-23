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
    $elapsedTimeArray = @()
    

    #add field descriptions to $shipsTable
    #$fieldDescriptions = & ($rootPath+"\fieldDescriptions.ps1")
    #$shipsTable       += $fieldDescriptions


#endregion init


#region functions

        function getShipData {
                param($shipID)


        }

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

    function requestValue {
        param(
            $shipID,
            $field
        )
        #build request string
        #example: https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=3248404240&fields=default_profile.battle_level_range_min
        $URI      = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=$shipID&fields=$field"
        $response = Invoke-RestMethod -Uri $URI -Method Get
        $value    = $response.data.PSObject.Properties.Value.$field
        return $value
    }

    function exportShipTable{
        Param(
            $rootPath,
            $shipsTable
        )

        # Determine the path and file name to save the CSV
        $outputFilePath = Join-Path -Path $rootPath -ChildPath "ships.csv"

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
        #cls
        $timer   = [Diagnostics.Stopwatch]::StartNew()
        $counter = $shipsIdList.IndexOf($shipID)+1
        write-host Processing $counter of $shipsIdList.count " - " -NoNewline


        $URI           = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1&ship_id=$shipID"
        $response      = Invoke-RestMethod -Uri $URI -Method Get
        $artilleryData = $response.data.psobject.Properties.value.default_profile.artillery
        #$shipID        = $response.data.PSObject.Properties.Value.ship_id

        
        #count artillery slots
        $artillerySlotCount = (($response.data.psobject.Properties.value.default_profile.artillery.slots) | measure).Count
        $shipName           = $response.data.psobject.Properties.value.name

        if ($artillerySlotCount -lt 2){
            $tier           = $response.data.psobject.Properties.Value.tier
            $type           = $response.data.psobject.Properties.Value.type
            $is_premium     = $response.data.psobject.Properties.Value.is_premium
            $is_special     = $response.data.psobject.Properties.Value.is_special
            $nation         = $response.data.psobject.Properties.Value.nation
            $reloadTime     = $response.data.psobject.Properties.value.default_profile.artillery.shot_delay
            $gun_rate       = $response.data.psobject.Properties.value.default_profile.artillery.gun_rate
            $barrels        = ($response.data.psobject.Properties.value.default_profile.artillery.slots.0).barrels
            $guns           = ($response.data.psobject.Properties.value.default_profile.artillery.slots.0).guns
            $RPM            = $guns*$barrels*$gun_rate
            $max_dispersion = $response.data.psobject.Properties.value.default_profile.artillery.max_dispersion
        
            $shipObject  = [PSCustomObject]@{
                shipName       = $shipName
                shipID         = $shipID
                type           = $type
                tier           = $tier
                is_premium     = $is_premium
                is_special     = $is_special
                nation         = $nation
                reloadTime     = $reloadTime
                barrels        = $barrels
                guns           = $guns
                RPM            = $RPM
                max_dispersion = $max_dispersion
            }

            # Add the ship object to the array
            $shipsTable += $shipObject
        }
        #calc time
        $elapsedTime = $timer.Elapsed.TotalSeconds
        $elapsedTimeArray += $elapsedTime
        $averageTime       = ($elapsedTimeArray | measure -Average).Average
        $remainingCount    = ($shipsIdList.count) - $counter
        $timeLeft          = [Math]::Round([Math]::Ceiling($remainingCount * $averageTime))
        if($timeLeft -gt 60){
            $timeLeftMinutes = [Math]::Round([Math]::Ceiling($timeLeft/60))
            Write-Host $timeLeftMinutes minutes remaining
        }else{
            Write-Host $timeLeft seconds remaining
        }
    }

#endregion

exportShipTable -rootPath $rootPath -shipsTable $shipsTable











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








        loop through attributes
        foreach ($attribute in $attributes) {
           Write-Host "fetching attribute: " $attribute ": " -NoNewline


           #generate a new request for the attribute
           $response = sendFieldRequest -shipID $shipID -field $attribute
           
           #get attribute value
           $value = extractFieldValue -response $response -field $attribute
           Write-Host  $value

           $value = requestValue -shipID $shipID -field $attribute 


            Add a new key-value pair using Add-Member
           $shipObject | Add-Member -MemberType NoteProperty -Name $attribute -Value $value -ErrorAction SilentlyContinue
        }





        $attributes = @(
            "default_profile.artillery", 
            "default_profile.artillery.artillery_id", 
            "default_profile.artillery.artillery_id_str", 
            "default_profile.artillery.distance", 
            "default_profile.artillery.gun_rate", 
            "default_profile.artillery.max_dispersion", 
            "default_profile.artillery.rotation_time", 
            "default_profile.artillery.shot_delay", 
            "default_profile.artillery.shells", 
            "default_profile.artillery.shells.bullet_mass", 
            "default_profile.artillery.shells.bullet_speed", 
            "default_profile.artillery.shells.burn_probability", 
            "default_profile.artillery.shells.damage", 
            "default_profile.artillery.shells.name", 
            "default_profile.artillery.shells.type", 
            "default_profile.artillery.slots", 
            "default_profile.artillery.slots.barrels", 
            "default_profile.artillery.slots.guns", 
            "default_profile.artillery.slots.name"
                    )








#>



        <#
        #init $shipObject
        $response    = sendFieldRequest  -shipID $shipID     -field "description"
        $description = extractFieldValue -response $response -field "description"
        $shipID      = extractFieldValue -response $response -field "shipID"
        #>

