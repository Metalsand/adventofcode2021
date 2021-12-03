[char[][]]$inputData = Get-Content .\day3\input.txt
$binaryCount = 0,0,0,0,0,0,0,0,0,0,0,0
forEach($numArray in $inputData){
    for($i = 0; $i -lt 12; $i++){
        if([int32]$numArray[$i]-48){$binaryCount[$i]++}
        else{$binaryCount[$i]--}
    }
}
$gBin = forEach($num in $binaryCount){
    if($num -gt 0){
        1
    }else{0}
}
$eBin = forEach($num in $binaryCount){
    if($num -lt 0){
        1
    }else{0}
}
$gamma = [convert]::ToInt32([string]-Join $gBin, 2)
$epsilon = [convert]::ToInt32([string]-Join $eBin, 2)
Write-Output("Day 3 Part 1: " + $gamma*$epsilon)
