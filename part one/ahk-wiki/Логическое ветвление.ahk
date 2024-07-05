#SingleInstance,force

ckeck := false

^1::
ToolTip, %ckeck%
if(ckeck)
	MsgBox, Сейчас условие верно!
else
	MsgBox, Условие не верно
ckeck := !ckeck
Return