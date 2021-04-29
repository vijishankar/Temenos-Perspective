Function Test-ScriptBlock
{
    Param
    (
        [string[]]$ParameterName
    )
    BEGIN
    {
        Write-Host $ParameterName
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
