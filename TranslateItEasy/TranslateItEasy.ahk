﻿/* TranslateItEasy v1.0

Last modified: 2023.06.15 18:30 (UTC+3)
Compatible with AHK: 1.1.34

Summary: script for translating English words into Russian from the working environment

Script author: 1mafe a.k.a. vade, tifosha
Contacts:
	- Discord: 1vade
	- Email: tyndrafeed@gmail.com
GitHub:


*/

#SingleInstance, Force ; Determines whether a script is allowed to run again when it is already running. Force means skips the dialog box and replaces the old instance automatically
#Include, %A_ScriptDir%\Lib\JSON.ahk

f1::

APIURL := "https://api.reverso.net/translate/v1/translation"

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
ClipSaved := ClipboardAll   ;
Clipboard := ClipSaved
langFrom := "eng"
langTo := "ru"

global WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Data := "{format:'text',from:'" langfrom "' ,input:'" Clipboard "',options:{contextResults:true,languageDetection:true,origin:'reversomobile',sentenceSplitter:false,},to:'" langTo "'}"

WebRequest.Open("POST", APIURL)
WebRequest.SetRequestHeader("Content-Type","application/json")
WebRequest.Send(Data)

Response := JSON.Load(WebRequest.ResponseText)
MsgBox, % Response["translation"][1]
ClipSaved := ""

f2::	; f2 hotkey.
{
	Reload
}

f3::	; f3 hotkey.
{
	Pause -1
}