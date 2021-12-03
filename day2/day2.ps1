function Part1{
    $location = @{distance=0;depth=0}
    $subMoves = forEach($row in $(Import-CSV -Path .\day2\input.txt -Delimiter ' ' -Header $('dir','dist')))
    {
        [PSCustomObject]@{
            dir = [String]$row.dir
            dist = [Int32]$row.dist
        }
    }
    forEach($move in $subMoves){
        switch($move.dir)
        {
            "up"{$location.depth -= $move.dist}
            "down"{$location.depth += $move.dist}
            "forward"{$location.distance += $move.dist}
            "backward"{$location.distance -= $move.dist}
        }
    }
    Write-Output("Part 1 is " + $location.distance * $location.depth)
}
function Part2{
    $location = @{distance=0;depth=0;tilt=0}
    $subMoves = forEach($row in $(Import-CSV -Path .\day2\input.txt -Delimiter ' ' -Header $('dir','dist')))
    {
        [PSCustomObject]@{
            dir = [String]$row.dir
            dist = [Int32]$row.dist
        }
    }
    forEach($move in $subMoves){
        switch($move.dir)
        {
            "up"{$location.tilt -= $move.dist}
            "down"{$location.tilt += $move.dist}
            "forward"{
                $location.distance += $move.dist
                $location.depth += $($move.dist * $location.tilt)
                Write-Output($move.dist + " " + $location.tilt)
            }
            "backward"{
                $location.distance -= $move.dist
                $location.depth -= $move.dist * $move.tilt
            }
        }
    }
}

Part1
Part2