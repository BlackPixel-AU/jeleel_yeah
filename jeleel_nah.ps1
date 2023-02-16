# jeleel_nah script
# Version 1.0
# Created 16/03/2023
# https://github.com/BlackPixel-AU/jeleel_yeah

# undoes jeleel_yeah.ps1


#location of wallpaper image
$wallpaper_local = "C:\Users\Public\jeleel.jpg" 

#remove wallpaper
Write-Host "Removing jeleel.jpg from"$wallpaper_local
remove-item $wallpaper_local

#set wallpaper
Write-Host "Setting wallpaper to default"
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
[Win32.Wallpaper]::SetWallpaper("C:\Windows\Web\Wallpaper\Windows\img0.jpg")

#remove youtube desktop link
Write-Host "Removing desktop shortcut"
remove-item "$Home\Desktop\jeleel.lnk"


#remove .ps1 to host
Write-Host "Removing jeleel_yeah.ps1 from" $ps1_file
$ps1_file = "C:\Users\Public\jeleel_yeah.ps1"
remove-item $ps1_file

#remove start bat
Write-Host "Removingjeleel_start.bet from" $bat_file
$bat_file = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\jeleel_start.bat"
remove-item $bat_file

Write-Host "Done!"
Write-Host "Exiting..."
Start-Sleep -Seconds 3

#end