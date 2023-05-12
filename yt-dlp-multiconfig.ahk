;@Ahk2Exe-SetCopyright    Dobbelina
;@Ahk2Exe-SetDescription  yt-dlp-multiconfig
;@Ahk2Exe-SetFileVersion   1.2.0.0
;@Ahk2Exe-SetProductName   yt-dlp-multiconfig.exe
;@Ahk2Exe-SetProductVersion   1.2.0.0

#NoEnv
#Include PageUrl.ahk
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%
dir = %A_ScriptDir%\presets
IniName = yt-dlp-multiconfig.ini

if !FileExist(IniName)
{
IniWrite, Path to executable with double ""double"" quotes if space in filepath, %IniName%, Options, ProgramPath
IniWrite, mp4 video + subs ass convert, %IniName%, Options, Preset1
IniWrite, mp3 audio only, %IniName%, Options, Preset2
IniWrite, Subs only original format, %IniName%, Options, Preset3
IniWrite, p, %IniName%, Options, Shortcut
IniWrite, off, %IniName%, Options, Debug
FileCreateDir, %dir%
FileInstall presets\preset1.txt, presets\preset1.txt
FileInstall presets\preset2.txt, presets\preset2.txt
FileInstall presets\preset3.txt, presets\preset3.txt
MsgBox Ini file in same diretory
ExitApp
}
IniRead, ProgramPath, yt-dlp-multiconfig.ini, Options, ProgramPath
IniRead, Preset1, yt-dlp-multiconfig.ini, Options, Preset1
IniRead, Preset2, yt-dlp-multiconfig.ini, Options, Preset2
IniRead, Preset3, yt-dlp-multiconfig.ini, Options, Preset3
IniRead, Shortcut, yt-dlp-multiconfig.ini, Options, Shortcut

Progress,B2 fs18 c0 zh0  w350 h30 CW4e8af2 CTFFFFFF,Download = Ctrl + %Shortcut% F4 To Exit ,, yt-dlp-dl-Notification
Fader()

Hotkey,^%Shortcut%,DoIt
Return

DoIt:
Progress,B2 fs16 c0 zh0  w400 h80 CW00CC00 CTFFFFFF,Press "1" %Preset1%`nPress "2" %Preset2%`nPress "3" %Preset3%
Loop {
If (getKeyState("1", "P")) or (getKeyState("Numpad1", "P"))
gosub, Label1
else if (getKeyState("2", "P")) or (getKeyState("Numpad2", "P"))
gosub, Label2
else if (getKeyState("3", "P")) or (getKeyState("Numpad3", "P"))
gosub, Label3
Sleep 50
}
return

label1:
Opt = %A_ScriptDir%\presets\preset1.txt
DownloadWithPreset(Opt)
clipboard := ""
Exit

label2:
Opt = %A_ScriptDir%\presets\preset2.txt
DownloadWithPreset(Opt)
clipboard := ""
Exit

label3:
Opt = %A_ScriptDir%\presets\preset3.txt
DownloadWithPreset(Opt)
clipboard := ""
Exit

F4::
Progress,B2 fs18 c0 zh0  w290 h30 CW4e8af2 CTFFFFFF cbBlack,Closing Yt-dlp-multiconfig,, yt-dlp-dl-Notification
Fader()
ExitApp

DownloadWithPreset(Opt) {
  global ProgramPath
  IniRead, Debug, yt-dlp-multiconfig.ini, Options, Debug
  Progress, off
  accData:= GetAccData() 
  url := accData.2
  RegExMatch(clipboard, "^(?:https?:\/\/)?(?:[^@\/\n]+@)?(?:www\.)?([^:\/?\n]+)\/", pagelink)
  if (pagelink)
  url := clipboard 
  RegExMatch(accData.2, "^(?:https?:\/\/)?(?:[^@\/\n]+@)?(?:www\.)?([^:\/?\n]+)\/", referer)
  if (Debug != "off") {
    Run, %comspec% /k %ProgramPath% --config-locations %Opt% --referer %referer% %url%
  } 
  else {
    Run, %ProgramPath% --config-locations %Opt% --referer %referer% %url%
  }
}

Fader(){
Iterations =
 Loop, 7
{
 Iterations +=36.42
    WinSet, Transparent, %Iterations%, yt-dlp-dl-Notification
    Sleep, 60
}
WinSet, TransColor, Off, yt-dlp-dl-Notification
Sleep, 1215
 Loop, 7
{
 Iterations -= 36.42
    WinSet, Transparent, %Iterations%, yt-dlp-dl-Notification
    Sleep, 30
}
Progress, off
WinSet, TransColor, Off, yt-dlp-dl-Notification
return
}
