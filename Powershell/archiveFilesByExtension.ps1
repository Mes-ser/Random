$dic = @{"Movies" = ".mp4",".mkv";
          "WebM" = ".webm";
          "SWF" = ".swf";
          "Images" = ".jpg",".jpeg",".png";
          "GIF" = ".gif";
          "Docs" = ".pdf",".doc",".docx", ".txt","xlsx";
          "Torrents" = ".torrent";
          "Exe" = ".exe";
          "Zips" = ".zip",".7z",".rar";
          "Music_Sounds" = ".mp3",".flac";
        }

$srcFolder = "PathtoYourDownloadFolder"
$destMainFolder = "PathToDestFolder"

$year = Get-Date -UFormat "%Y"
$month = Get-Date -Uformat "%m"
$month = (Get-Culture).DateTimeFormat.GetMonthName($month)

$destFolder = "$destMainFolder$month $year"

#$dic.GetType().Name
New-Item $destFolder -type directory -Force

Foreach ($key in $dic.keys)
{
  $destFolderByExt = "$destFolder\$key"
  New-Item $destFolderByExt -type directory -Force
  Foreach ($extension in $dic.$key)
  {
    Get-ChildItem -Path $srcFolder -Filter "*$extension" -Recurse | Move-Item -Destination $destFolderByExt -Force
  }
}

$directoryInfo = Get-ChildItem $srcFolder | Measure-Object
if($directoryInfo.count -gt 0){
  New-Item "$destFolder\Inne" -type directory -Force
  Get-ChildItem -Path $srcFolder -Recurse | Move-Item -Destination "$destFolder\Inne" -Force
}
