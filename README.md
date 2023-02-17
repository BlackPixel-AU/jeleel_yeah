# Jeleel Powershell Script

![alt text](https://i.kym-cdn.com/photos/images/newsfeed/002/356/227/124.jpg)

Born from a meme on the uni Discord server, is pretty much PUP. 

Use `jeleel_yeah.ps1` to install and `jeleel_nah.ps1` to remove. 

You may need to enable Powershell scripts by running `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted` in an elevated Powershell prompt first 
(this can be reverted with `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted`).

<sub> Images belong to their respective owners. This script requires an internet connection to download images. </sub>


## ✨ Version 1.1 
- Fixed issue that stopped the login batch file from being created correctly. 
- Wrapped most functions in a try-catch for exceptions. 
- Script will now check if files exist before overwriting them.
- Replaced some hard-coded items with variables. 
- Sleep timer reduced to 1 second. 
- Added warning prompt to uninstaller script. 
- Added ASCII art. 
