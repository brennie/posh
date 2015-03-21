function IsAdministrator {
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    return (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

$global:HostName = (hostname)
$global:IsAdministrator = IsAdministrator

function global:prompt
{
    if ($global:IsAdministrator)
    {
        Write-Host -NoNewline $env:UserName -ForegroundColor Red
    }
    else
    {
        Write-Host -NoNewline $env:UserName -ForegroundColor White
    }

    Write-Host -NoNewline "@"
    Write-Host -NoNewline $global:HostName -ForegroundColor White
    Write-Host -NoNewline " "
    Write-Host -NoNewline (Get-Location.Path -ForegroundColor White)

    return "> "
}

Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
