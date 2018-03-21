# Discover
$LDDSRV = (Get-VMReplication).Name

# Counter
$C = 0
$F = $LDDSRV.Count

# Start JSON
Write-Host "{"
Write-Host " `"data`":["

# For each server in $LDDSRV
Foreach ($LDDSRV in $LDDSRV)
    {
    # Counter to not print comma after last object
    $C++
    Write-Host "   {"

    if ($LDDSRV -ne "") { Write-Host "     ""{#SRVNAME}"": ""$LDDSRV""" }
    
    if ($C -lt $F) { Write-Host "   }," }
    else { Write-Host "   }" }
 
    }
    Write-Host " ]"
    Write-Host "}"