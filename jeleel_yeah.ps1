# jeleel_yeah script
# Version 1.1
# Updated 2023-03-17
# https://github.com/BlackPixel-AU/jeleel_yeah

# use jeleel_nah.ps1 to undo changes


# @@@@ SCRIPT START @@@@ #

Write-Host '            __       .__                                     .__   '
Write-Host '           |__| ____ |  |   ____   ____   ____   ____   ____ |  |  '
Write-Host '           |  |/ __ \|  | _/ __ \_/ __ \_/ __ \_/ __ \_/ __ \|  |  '
Write-Host '           |  \  ___/|  |_\  ___/\  ___/\  ___/\  ___/\  ___/|  |__'
Write-Host '       /\__|  |\___  >____/\___  >\___  >\___  >\___  >\___  >____/'
Write-Host '       \______|    \/          \/     \/     \/     \/     \/      '
Write-Host '  '
Write-Host '                                   *####((#(#(((((((*                              '
Write-Host '                                  &&&&&##(///****,,,****/                          '
Write-Host '                                  #%&&&%#(/****/(*//*****.                         '
Write-Host '                                    &&%%%%%%%####(#///(/                           '
Write-Host '                       ./(/*****/#%&%%%%%%%%%%###%##(%.                            '
Write-Host '              /(/*,,,*,,,,,....**,,,,**///((((((//**,*****,****                    '
Write-Host '         .%%%##(//********,,,,,,,.....,,,,,,***....,,,,,,,,***,,,***/              '
Write-Host '        ,%%%####(((((((###((//**,,.........,,****.,,...,,*****////((//.            '
Write-Host '       #((((###(//****#&%%#####((((////****///((/**,/(((////((((((////.            '
Write-Host '     .%#(((/(((//////(%%%%%%%%########(((//***,,*******////((%%#((///////          '
Write-Host '     %###(((///////(. #%%%####(##((((((((((((/////////////(((%%%##((/////(         '
Write-Host '    /(/***//(((/((     *%%%%###((((((###(((((/////////((((((   /%##(((((//*,       '
Write-Host '   /#/**,,,,,,,**        .%%%%###((((((((((((////(((((((((.     %%((////**,**/     '
Write-Host '   %#(///*,,,***.                   .*/(########(((###.          .%#(((/*****/(    '
Write-Host '   ##(///****//(                                                    %%%#(//*,*//   '
Write-Host '   /#((/**,,**/                                                       .%#((**,*/.  '
Write-Host '    ,#(((/,**/.                                                          %%(/**//  '
Write-Host '     #((((/***,                                                         ,//*****/, '
Write-Host '      ###((/******/*                                                  #(((#(/***/( '
Write-Host '       ####((/////.                                                 ,%(///(((((/   '
Write-Host '         ###((###/*/.                                                              '
Write-Host '  '

#location of wallpaper image
$wallpaper_remote = "https://i.kym-cdn.com/photos/images/original/002/356/227/124.jpg" 
$wallpaper_local = "C:\Users\Public\jeleel.jpg" 

#download wallpaper
$webClient = New-Object System.Net.WebClient

if (-not(Test-Path -Path $wallpaper_local -PathType Leaf)) {
     try {
         Write-Host " * Downloading wallpaper to"$wallpaper_local
         $webClient.DownloadFile($wallpaper_remote,$wallpaper_local)
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
     Write-Host " * Wallpaper already downloaded, skipping. "
 }


#set wallpaper
Write-Host " * Setting wallpaper."

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
$shortcut_location = "$Home\Desktop\jeleel.lnk"

$wshShell = New-Object -comObject WScript.Shell
if (-not(Test-Path -Path $shortcut_location -PathType Leaf)) {
     try {
          Write-Host " * Creating desktop shortcut."
          $shortcut = $wshShell.CreateShortcut($shortcut_location)
          $shortcut.TargetPath = "https://youtu.be/MyY_KF5ZtEo"
          $shortcut.Save()
          }
     catch {
         throw $_.Exception.Message
           }
 }
 else {
     Write-Host " * Shortcut already on desktop, skipping. "
 }





#copy .ps1 to host
$ps1_file = "C:\Users\Public\jeleel_yeah.ps1"

if (-not(Test-Path -Path $ps1_file -PathType Leaf)) {
     try {
          Write-Host " * Writing jeleel_yeah.ps1 to host."
          $MyInvocation.MyCommand.ScriptContents | Out-File $ps1_file
          }
     catch {
         throw $_.Exception.Message
           }
 }
 else {
     Write-Host " * jeleel_yeah.ps1 already on host, skipping. "
 }

#create login bat
$bat_contents = 'powershell.exe -ExecutionPolicy Bypass -Command C:\Users\Public\jeleel_yeah.ps1'
$bat_location = $env:APPDATA + '\Microsoft\Windows\Start Menu\Programs\Startup\jeleel_login.bat'

if (-not(Test-Path -Path $bat_location -PathType Leaf)) {
     try {
          Write-Host " * Writing jeleel_login.bat to host."
          Set-Content -Path $bat_location -Value $bat_contents
          }
     catch {
         throw $_.Exception.Message
           }
 }
 else {
     Write-Host " * jeleel_login.bat already on host, skipping. "
 }

#system startup folder (needs admin)
#Set-Content -Path 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\jeleel_start.bat' -Value 'powershell.exe -ExecutionPolicy Bypass -Command C:\Users\Public\jeleel_yeah.ps'


Write-Host " * Done!"
Start-Sleep -Seconds 1

# @@@@ SCRIPT END @@@@ #
