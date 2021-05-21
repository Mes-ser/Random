


Function TestFunc {
    $allUsersPackagesCount = Get-AppxPackage | Select-Object -Expand "Name"
    write-host ($allUsersPackagescount)
}


function Check-InstalledBloatware {
    param ([string]$filePath)
    $allUsersPackages = Get-AppxPackage | Select-Object -Expand "Name"
    foreach($line in Get-Content $filePath){
        if($allUsersPackages -contains $line){
            Write-Host $line "need to be removed"
        } else{
            Write-Host $line "doesn't exists in system"
        }
    }
}

#TestFunc
Check-InstalledBloatware("toDelete.txt")