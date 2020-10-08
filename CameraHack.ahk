#SingleInstance Force
#InstallKeybdHook
#NoEnv
SetWorkingDir %A_ScriptDir%

; Создание GUI
Menu, Tray, NoStandard ; Очищаем дефолтный трей
Menu, Tray, Add , &Запустить DOTA, Dota ; добавляем в трей запуск доты
Menu, Tray, Add , &Exit, ButtonExit ; И кнопку закрытия
IniRead, DotaPath, Config.ini, Config, DotaPath ; Читаем путь до dota2beta из .ini
IniRead, Key, Config.ini, Config, Hotkey ; Основной хоткей,
IniRead, Camera, Config.ini, Config, Camera ; Позицию камеры,
IniRead, Acc, Config.ini, Config, Accepter ; Хоткей автопринятия игры
Run Patcher.py
Hotkey, %Key%, Cheat ; Задаем основной хоткей
Hotkey, %Acc%, Accepter ; И хоткей автопринятия
return

; Трей. Запуск доты
Dota:
Run Patcher.py
Return
; Трей. Закрыть чит
ButtonExit:
ExitApp

; Ввод читов
Cheat:
Send \
Sleep 100
SendInput sv_cheats 1
SendInput {Enter}
Sleep 100
SendInput dota_use_particle_fow 0
SendInput {Enter}
Sleep 100
SendInput fog_enable 0
SendInput {Enter}
Sleep 100
SendInput fow_client_nofiltering 1
SendInput {Enter}
Sleep 100
SendInput dota_camera_distance %Camera%
SendInput {Enter}
Sleep 100
SendInput r_farz 18000
SendInput {Enter}
Sleep 100
SendInput \
Return

; Автопринятие игры
Accepter:
tog:=!tog
if(tog)
    SetTimer, accept, 500, On
else
    SetTimer, accept, Off
return

accept:
Send {Enter}
ToolTip, Автопринятие игры включено
SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
SoundBeep
ToolTip
return