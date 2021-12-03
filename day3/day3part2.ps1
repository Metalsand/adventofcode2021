[char[][]]$inputData = Get-Content .\day3\input.txt
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
            if([int32]$numArray[$i]-48 -eq $bitPosition)
            {
                $numArray
            }
        }
        $inputData = forEach($numArray in $inputData){
            if([int32]$numArray[$i]-48 -eq $bitPosition){$numArray}
        }
        #Write-Output("Total entries in inputData " + $inputData.Count)
        #Write-Output($bitPosition)
    }
}
Write-Output("Final input data count " + $inputData.Count)