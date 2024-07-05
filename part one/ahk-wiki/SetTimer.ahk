Numpad1::
SetTimer, CloseMailWarnings, 16 ; выше 17 не работает
; После активации подпрограммы, подготовливает таймер для следующего цикла, до тех пор когда его не выключить
sleep 1 ; с 0 не работает
SetTimer, CloseMailWarnings, off 
return

CloseMailWarnings1: ; данный скрипт не запускается
MsgBox, постая строка

CloseMailWarnings:
MsgBox, Активация
return






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