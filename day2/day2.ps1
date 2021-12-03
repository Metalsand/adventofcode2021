$subLocate = forEach($row in $(Import-CSV -Path .\input.txt -Delimiter ' ' -Header $('dir','dist')))
{
    [PSCustomObject]@{
        dir = [String]$row.dir
        dist = [Int32]$row.dist
    }
}
$subLocate[0].dist.GetType()
# $subLocate = $(Import-CSV -Path .\input.txt -Delimiter ' ' -Header $('dir','dist'))
# $subLocate.dir.GetType()
# $subLocate.dir = $subLocate.dir -As [string[]]
# $test = $subLocate.dir -As [string[]], $subLocate.dist -As [int[]]
# $currentCoordinates = 0,0
# Write-Output $test

