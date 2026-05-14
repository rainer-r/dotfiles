# ALIASES
Set-Alias gfs Get-FolderSize
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias py python

# SHELL INITIALIZATION
Invoke-Expression (& { (zoxide init powershell | Out-String) })
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\pwsh\my_theme.omp.json" | Invoke-Expression

# SOURCED FUNCTIONS
. $env:USERPROFILE\.config\pwsh\script-helper\Get-FolderSize.ps1
. $env:USERPROFILE\.config\pwsh\script-helper\whereis.ps1
. $env:USERPROFILE\.config\pwsh\script-helper\which.ps1

# IMPORTED MODULES
Import-Module Terminal-Icons
Import-Module PSReadLine

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView 
Set-PSReadLineKeyHandler -Key "Alt+j" -Function NextHistory
Set-PSReadLineKeyHandler -Key "Alt+k" -Function PreviousHistory

# Env
$env:UV_CACHE_DIR = "D:\.config\uv_cache"
