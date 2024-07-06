#SingleInstance,force


Numpad1::
{
	if (Clipboard == "`r`n")
		MsgBox, Буфер пуст!
		;~ break
	else
		MsgBox, :%Clipboard%:
}
return

Numpad0::
{
	Clipboard := ""
}
return

End::
{
reload
Return
}

Home::pause