Numpad1::
{
string =
(
Банковская карта
220220**6660
)
MsgBox, % RegExReplace(string, "[*]")
}
Return



{
string := "[11:16]Сообщение от Иг[р]ок2[31]: Привет"
MsgBox, % RegExReplace(string, ".*\[(\d+)]:.*", "$1")
}
Return



;F89733
Numpad2::
{
 PixelSearch, Px, Py, 1271, 884, 1442, 1045, 0xF89733, 3, Fast RGB
  if (ErrorLevel = 0){
  MouseClick, left, %Px%, %Py%
  Sendinput,{Shift Down}{Down}{Left}{Shift Up}^{c}
  }
}
Return

Numpad3::
{
SendInput, ^{v}
;MsgBox, %clipboard%
}
Return

Numpad4::
{
MsgBox, %text%
}
Return

End::
{
reload
Return
}

Home::
{
pause
Return
}
