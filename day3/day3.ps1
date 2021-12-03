[char[][]]$inputData = Get-Content .\day3\input.txt
$binaryCount = 0,0,0,0,0,0,0,0,0,0,0,0
forEach($numArray in $inputData){
    for($i = 0; $i -lt 12; $i++){
        if([int32]$numArray[$i]-48){$binaryCount[$i]++}
        else{$binaryCount[$i]--}
    }
}
Write-Output($binaryCount)
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

#part 2
#Oxygen generator - Go down the list in iteration; byte[0] for all, then whatever bit is most common in all entries, dump those with that bit into a list, then continue with byte[1]

for($i = 0; $i -lt 1; $i++)
{
    if($inputData.Count -ne 1)
    {
        $seriesCount = 0;
        $bitPosition = 0;
        forEach($numArray in $inputData)
        {
            #Write-Output([int32]$numArray[$i]-48) 
            if([int32]$numArray[$i]-48){$seriesCount++}
            else{$seriesCount--}
        }
        if($seriesCount -gt 0){$bitPosition = 1}

        forEach($numArray in $inputData){
            Write-Output([String]$([int32]$numArray[$i]-48) + " and bit position is $bitposition")
            Write-Output($numArray[$i] + $numArray[$i].GetType())
            if([int32]$numArray[$i]-48 -eq $bitPosition){$numArray}
        }
        $inputData = forEach($numArray in $inputData){
            if([int32]$numArray[$i]-48 -eq $bitPosition){$numArray}
        }
        #Write-Output("Total entries in inputData " + $inputData.Count)
        #Write-Output($bitPosition)
    }
}
Write-Output("Final input data " + $inputData)