Function Test-ScriptBlock
{
    Param
    (
        [string[]]$ParameterName
    )
    BEGIN
    {
        $Results = $ParameterName
        Write-Host $Results
    }
 
    PROCESS
    {
        Write-Host "In Process block"
    }
    END
    {
        Write-Host "In End block"
    }
}


Test-ScriptBlock -ParameterName viji
