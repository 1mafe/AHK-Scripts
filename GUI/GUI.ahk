#SingleInstance Force ; Determines whether a script is allowed to run again when it is already running. Force means skips the dialog box and replaces the old instance automatically

MyGui := Gui()
MyGui.Add("Text",, "Please enter your name:")
MyGui.AddEdit("vName")
MyGui.Show

^b::
{
	Reload
}

^p::
{
	Pause 1
}
^!p::
{
	Pause 0
}