# |  | select-string versionName
$content = invoke-expression "adb shell dumpsys package com.xx.xx.xx"
#write-host $content
$_obiekt = select-string -inputobject $content -Pattern Packages: -Context 0,15 -CaseSensitive

#$_obiekt | Get-Member

$_obiekt | Out-String