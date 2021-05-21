# przywrocenie apek 
#Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# kasowanie 
#Get-AppxPackage *officehub* | Remove-AppxPackage

# Włączenie WSL 
#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# zlicza liczbe pakietow
#Get-AppxPackage -AllUsers | Select -Expand "Name" | Measure-Object -Line
