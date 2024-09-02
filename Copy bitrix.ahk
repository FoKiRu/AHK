#SingleInstance,force


; Скрипт для фильтрации текста из буфера обмена

Numpad1:: ; Горячая клавиша для активации скрипта (Ctrl+C)
	; Активировать окно Excel
    IfWinActive, Лид - Google Chrome
    {
        imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WiKi\Pictures\AHK\КомБит.png
		if (ErrorLevel = 0) {
            Clipboard :=
            ;SendInput, ^{l}^{c}
            ;link := Clipboard
            x += 30
            y += 73
            MouseClick, left, %x%, %y%
            Sleep, 1024+512
            SendInput, ^{a}
            Sleep, 128
            Send, ^{c}
            ; Comment := Clipboard
            ; lcArray := [link, Comment]
            ; Clipboard := lcArray[Comment] "`r`n" lcArray[link]
            ; MsgBox, %Clipboard%

		} Else
            MsgBox, Error Comment
    }
	If WinExist("Не отправленные лиды - Excel")
        {
            WinActivate ; Активирует найденное окно.
            Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
            SendInput, ^{v}{Right}
        }
        Sleep, 256
    If WinExist("Лид - Google Chrome")
        {
            WinActivate ; Активирует найденное окно.
            Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
            SendInput, ^{tab}
            MouseMove, 0, -100, 0, R
        }
return




End::
{
reload
Return
}

Home::pause