/* POEMaster.ahk
Version: 0.1
Last edit: 02.06.2023 16:30
Compatible with AHK: 2.0.2

Summary: collection of useful scripts for the game "Path of Exile", managed by GUI

Description: this script is used to automate some processes in Path Of Exile and help in some other situations that require any control, for example:
	- Mageblood Heavy Belt emulation (auto-flasks which you can edit as you whish)
	- etc.
*/

#SingleInstance Force ; Determines whether a script is allowed to run again when it is already running. Force means skips the dialog box and replaces the old instance automatically
#HotIf WinActive("ahk_exe PathOfExileSteam.exe")
SendMode("Event")

f1 & f2::	; F1 + F2 hotkey.
{
	Send "{Ctrl Down}qwert{Ctrl Up}e"
}

Loop
{

	if (PixelGetColor(124, 974) != 0x93151A and WinActive("ahk_exe PathOfExileSteam.exe"))
	{
		Send "1"
	}

	if (PixelGetColor(361, 1035) == 0x1C9162 and WinActive("ahk_exe PathOfExileSteam.exe"))
	{
		Send "2345"
	}
}

^!z::  ; Control+Alt+Z hotkey.
{
    MouseGetPos &MouseX, &MouseY
    MsgBox "The color at the current cursor position is " PixelGetColor(MouseX, MouseY) " and X " MouseX " and Y " MouseY
}
#HotIf

^b::	; Control+B hotkey.
{
	Reload
}

^p::	; Control+P hotkey.
{
	Pause 1
}
^!p::	; Control+Alt+P hotkey.
{
	Pause 0
}
