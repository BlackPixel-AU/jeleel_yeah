# jeleel_yeah script
# Version 1.0
# Created 16/03/2023
# https://github.com/BlackPixel-AU/jeleel_yeah

# use jeleel_nah.ps1 to undo changes

#location of wallpaper image
$wallpaper_remote = "https://i.kym-cdn.com/photos/images/original/002/356/227/124.jpg" 
$wallpaper_local = "C:\Users\Public\jeleel.jpg" 

#download wallpaper
Write-Host "Downloading wallpaper to"$wallpaper_local
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($wallpaper_remote,$wallpaper_local)

#set wallpaper
Write-Host "Setting wallpaper"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@
add-type $code 
[Win32.Wallpaper]::SetWallpaper($wallpaper_local)

#create youtube desktop link
Write-Host "Creating desktop shortcut"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\jeleel.lnk")
$Shortcut.TargetPath = "https://youtu.be/MyY_KF5ZtEo"
$Shortcut.Save()

#copy .ps1 to host
Write-Host "Writing jeleel_yeah.ps1"
$ps1_file = "C:\Users\Public\jeleel_yeah.ps1"
$MyInvocation.MyCommand.ScriptContents | Out-File $ps1_file

#create start bat
Write-Host "Writing jeleel_start.bet"
$bat_file = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\jeleel_start.bat"
$bat_contents = "powershell.exe -ExecutionPolicy Bypass -Command C:\Users\Public\jeleel_yeah.ps1"
$bat_contents | out-file $bat_file

Write-Host "Done!"
Write-Host "Exiting..."
Start-Sleep -Seconds 3

#end