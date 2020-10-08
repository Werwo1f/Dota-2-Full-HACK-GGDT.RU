#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

IniRead, Console, Config.ini, Config, Console, % A_Space
IniRead, Hotkey, Config.ini, Config, Hotkey, % A_Space
IniRead, Accepter, Config.ini, Config, Accepter, % A_Space

Gui Add, Text, x10 y10, Путь до dota2beta:
Gui Add, Button, x110 y10 w100 h20, Указать
Gui Add, Text, x10 y40, Кнопка консоли:
Gui Add, Hotkey, vA1 x110 y40 w100 h20, % Console
Gui Add, Text, x10 y70, Высота камеры:
Gui Add, Edit, vA2 x110 y70 w100 h20, 1400
Gui Add, Text, x10 y100, Хоткей чита:
Gui Add, Hotkey, vA3 x110 y100 w100 h20, % Hotkey
Gui Add, Text, x10 y130, Автопринятие:
Gui Add, Hotkey, vA4 x110 y130 w100 h20, % Accepter
Gui Add, Button, gSaveConfig x10 y160, Сохранить и запустить
Gui Show, w215 h190, Config
Return
GuiClose:
ExitApp

ButtonУказать:
FileSelectFolder, Folder, 1
IniWrite, %Folder%, Config.ini, Config, DotaPath
Return

SaveConfig:
Gui, Submit, NoHide
GuiControlGet, %A_Index%
IniWrite, %A1%, Config.ini, Config, Console
IniWrite, %A2%, Config.ini, Config, Camera
IniWrite, %A3%, Config.ini, Config, Hotkey
IniWrite, %A4%, Config.ini, Config, Accepter
Run CameraHack.ahk
ExitApp