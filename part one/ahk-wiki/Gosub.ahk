Numpad1::
Gosub, Label2
MsgBox, Подпрограмма Label2 осуществила возврат (завершена).
Return

Label1:
MsgBox, Подпрограмма Label1 выполняется
Return

Label2:
MsgBox, Подпрограмма Label2 выполняется
Return


Numpad2::
Gosub, Label3
MsgBox, Действие №1

Label3:
MsgBox, Действие №2
Return

Numpad3::
Gosub, Label4
MsgBox, Это сообщение мы не увидим ; Так как в Label1 есть команда Exit.
Return

Label4:
MsgBox, Выход
Exit ; Которая завершает как данную подпрограмму Label1, так и вызвавшую её.



Numpad4::
Gosub, Label5
Return


Label5:
MsgBox, Label5
Return

Label6:
MsgBox, Label6