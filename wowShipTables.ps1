$uri = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no=1"
$baseuri = "https://api.worldofwarships.com/wows/encyclopedia/ships/?application_id=0461d545fdf71ee8d9daffdd24c62438&page_no="
$response =  Invoke-RestMethod -Uri $uri -Method Get
$meta =  $response.meta 
$data =  $response.data 

#get page count
$shiptotal = $meta.total
$pagesize = $shiptotal / 100
$pagecount = [math]::Ceiling($pagesize)


# Initialize an empty array to store the data
$shipsTable = @()


#get each page

# For loop that runs based on the value of $loopSize
for ($i = 0; $i -lt $pagecount; $i++) {

    #set page number
    $uripaged = $baseuri + $pagecount


    $response =  Invoke-RestMethod -Uri $uripaged -Method Get


    $shipData = $response.data.PSObject.Properties.Value


    foreach ($ship in $shipData) {


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

        # Add the ship object to the array
        $shipsTable += $shipObject
    }


}




$shipsTable | Format-Table -AutoSize

# Determine the path to save the CSV
$outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath "ships.csv"

# Export the table to a CSV file in the script's directory
$shipsTable | Export-Csv -Path $outputFilePath -NoTypeInformation