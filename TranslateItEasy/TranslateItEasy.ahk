/* TranslateItEasy v1.1.2

Last modified: 2023.06.27 18:30 (UTC+3)
Compatible with AHK: 1.1.36

Summary: script for translating English words into Russian from the working environment

Script author: 1mafe a.k.a. vade, tifosha
Contacts:
	- Discord: 1vade
	- Email: tyndrafeed@gmail.com
GitHub: https://github.com/1mafe/AHK-Scripts/tree/main/TranslateItEasy/

Thanks to: AHK Discord Community (https://discord.gg/autohotkey) and especially to Bkid and Oakenlix
*/

#SingleInstance, Force	 ; Determines whether a script is allowed to run again when it is already running. Force means skips the dialog box and replaces the old instance automatically
#Include, %A_ScriptDir%\Lib\JSON.ahk	 ; JSON lib to parse
#Include, %A_ScriptDir%\Lib\ToolTipSize.ahk		; ToolTipSize lib to change font and size

Step := 0
ToolTipFont("s20", "Arial Black")		; ToolTip Font and Size (with ToolTipSize lib)

f1:: 	; F1 hotkey
if (step == 0)		; To On/Off ToolTip
{
	ClipSaved := ClipboardAll   ; Saving data in clipboard
	Clipboard := ClipSaved
	APIURL := "https://api.reverso.net/translate/v1/translation"	; Translator Website

	langFrom := "eng"	; Chosen languages (should be gui for choosing)
	langTo := "ru"
	Data :=
	(
	{format:"text",from:"%langfrom%",input:"%Clipboard%",options:{contextResults:true,languageDetection:true,origin:"reversomobile",sentenceSplitter:false,},to:"%langTo%"}
	)	; Bkid helped me with this variable, which send to website json request. Upd1: fixed confusion with defiition of ' and " by using multiline.

	/*
	Valid Languages (could be others, unsure):

	arabic: 'ara'
	german: 'ger'
	spanish: 'spa'
	french: 'fra'
	hebrew: 'heb'
	italian: 'ita'
	japanese: 'jpn'
	dutch: 'dut'
	polish: 'pol'
	portuguese: 'por'
	romanian: 'rum'
	russian: 'rus'
	ukrainian: 'ukr'
	turkish: 'tur'
	chinese: 'chi'
	english: 'eng'
	*/

	global WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1") 	; WinHTTPRequest to interact with the site
	WebRequest.Open("POST", APIURL)		; Opens an HTTP connection to an HTTP resource.
	WebRequest.SetRequestHeader("Content-Type","application/json")		; Adds, changes, or deletes an HTTP request header.
	WebRequest.Send(Data)		; Sends an HTTP request to an HTTP server.

	Response := JSON.Load(WebRequest.ResponseText) ; Again Bkid helped me. JSON.Load is loading json array into an object (Response)
	ToolTip, % Response["translation"][1], 1920, 1027 	; And our output converting by ["translation"][1]

	ClipSaved := ""		; Free the memory of the clipboard.
	step := 1
	return
}

else
{
	ToolTip		; Off ToolTip
	step := 0
	ClipSaved := ""
	return
}

f2::	; f2 hotkey.
{
	Reload
}

f3::	; f3 hotkey.
{
	Pause -1
}