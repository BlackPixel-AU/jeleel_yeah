# jeleel_nah script
# Version 1.1
# Updated 2023-03-17
# https://github.com/BlackPixel-AU/jeleel_yeah

# undoes jeleel_yeah.ps1


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

#file locations
$wallpaper_local = 'C:\Users\Public\jeleel.jpg'
$desktop_link = $Home + '\Desktop\jeleel.lnk'
$ps1_file = "C:\Users\Public\jeleel_yeah.ps1"
$bat_file = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\jeleel_login.bat"


#confirmation prompt
Write-Host '************************ ! WARNING ! ************************'
Write-Host '*************************************************************'
Write-Host 'The following files will be deleted from your system:'
Write-Host ''
Write-Host '- ' $wallpaper_local
Write-Host '- ' $desktop_link
Write-Host '- ' $ps1_file
Write-Host '- ' $bat_file
Write-Host '-  Your wallpaper will also be changed to the Windows default.'
Write-Host ''
$confirmation = Read-Host "Type yes to proceed"
if ($confirmation -eq 'yes') {


#remove wallpaper

if (Test-Path -Path $wallpaper_local -PathType Leaf) {
     try {
         Write-Host "* Removing jeleel.jpg from"$wallpaper_local
         remove-item $wallpaper_local
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
     Write-Host " * No wallpaper found, skipping. "
 }


#set wallpaper
Write-Host "* Setting wallpaper to default"
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

if (Test-Path -Path $desktop_link -PathType Leaf) {
     try {
         Write-Host "* Removing desktop shortcut"
         remove-item $desktop_link

     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
     Write-Host " * No desktop shortcut found, skipping. "
 }


#remove .ps1 from host

if (Test-Path -Path $ps1_file -PathType Leaf) {
     try {
         Write-Host "* Removing" $ps1_file
         remove-item $ps1_file
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
     Write-Host " * No .ps1 file found, skipping. "
 }


#remove login bat

if (Test-Path -Path $bat_file -PathType Leaf) {
     try {
         Write-Host "* Removing" $bat_file
         remove-item $bat_file
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
     Write-Host " * No .bat file found, skipping. "
 }

Write-Host " * Done!"
Start-Sleep -Seconds 1

} else {
    Write-Host " * Cancelled by user."
    Start-Sleep -Seconds 1
}

# @@@@ SCRIPT END @@@@ #
