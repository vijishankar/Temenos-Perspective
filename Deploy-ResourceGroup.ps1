Function Test-ScriptBlock
{
    Param
    (
        [int]$Number
    )
    BEGIN
    {
        Write-Host "In Begin block"
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
