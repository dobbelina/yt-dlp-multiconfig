# yt-dlp-multiconfig ![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
Browser utility for yt-dlp with multiple config files

yt-dlp-multiconfig is a utility to facilitate downloads in any browser with the popular  
yt-dlp program https://github.com/yt-dlp/yt-dlp

_**Features**_
 - _Should work with all browsers_
 - _3 different config options_
  - _Passes referer url to yt-dlp_
  
  **Instructions**  
Put yt-dlp-multiconfig.exe in a folder of your choice.  
First time you run it it will create a settings file called yt-dlp-multiconfig.ini in the same directory.  
Open that file with a texteditor and edit the path to yt-dlp.exe.   
A folder is also created called presets, where the **3 config files** are located.  

It is higly recommended to add yt-dlp to the path variable [How to add path](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/)  
It is also recommended to download ffmpeg.exe and put in the same folder as yt-dlp.exe.

 
If you want to change the shortcut key **Ctrl + p** you can do that as well to start the download process.  
To exit the program press **F4**

If you have several links on a page, right click and select "Copy link", then that link will be
downloaded instead of the current page link, when executing the download process.

**yt-dlp-multiconfig.ini Settings:**  
The Preset options can be named anything you want, reflecting what you put in the config files.  
If you change Debug to "on" yt-dlp will stay open for debugging purposes.  
For more thorough info add `--verbose` to the config file/s  

Example below where yt-dlp has no path because it's added to the path variable:
```
[Options]
ProgramPath=yt-dlp
Preset1=mp4 video + subs ass convert
Preset2=mp3 audio only
Preset3=Subs only original format
Shortcut=p
Debug=off
```
The `-P` switch in the config files sets the download location for the videos/subtitles etc  
Please delete any pre-existing config files or they will interfere with this program.

Download here: [yt-dlp-multiconfig.zip](https://github.com/dobbelina/yt-dlp-multiconfig/releases/latest/download/yt-dlp-multiconfig.zip)

![GitHub release (latest by date)](https://img.shields.io/github/downloads/dobbelina/yt-dlp-multiconfig/latest/total)
[![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fdobbelina%2Fyt-dlp-multiconfig&countColor=%23dce775&style=flat)](https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Fdobbelina%2Fyt-dlp-multiconfig)  
(Windows only)  


## Screenshot

<p align="center"><img src="yt-dlp-multiconfig.png" width="600" /></p>

