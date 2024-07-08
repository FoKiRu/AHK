#SingleInstance,force

LogForBit := "[Логины/аккаунты] Логины для Битрикса - Google Таблицы - Google Chrome"

ya := "Яндекс — быстрый поиск в интернете - Google Chrome"

ColRed := "Цвет заливки: светло-красный (3)"
ColGre := "Цвет заливки: светло-зеленый (3)"

num = П0

Numpad0::
{
SendInput, П%num%
num ++
}
return


Numpad1::
loop
{
ifWinExist, %LogForBit%  ; Убедиться, что Google Chrome открыт
{
	WinActivate  ; Активировать окно браузера
	SendInput, ^{c}
}
ifWinExist, %ya%  ; Убедиться, что Google Chrome открыт
{
	ControlClick, x368 y510, %ya%
	Sleep 100
	ControlSend, , {Ctrl Down}{a}{Ctrl Up}{Del}
	ControlSend, , {Ctrl Down}{v}{Ctrl Up}, %ya%
}
Sleep 512
imageSearch, x, y, 0, 0, 941, 952, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\thumbnail.png
if (ErrorLevel = 0)
	ColFun(LogForBit, ColRed)
else
	ColFun(LogForBit, ColGre)
;~ SendInput, !{/}%ColGre%{Enter}
;~ SendInput, {Enter} ; Баг с интером, то в строке работает, то в отдельной работае.
Sleep 512
}
return


ColFun(LogForBit, Col)
{
	ifWinExist, %LogForBit% ; [Логины/аккаунты] Логины для Битрикса - Google Таблицы - Google Chrome  ; Убедиться, что Google Chrome открыт
	{
		WinActivate  ; Активировать окно браузера
		Sleep 256
		SendInput, !{/}%Col%
		Sleep 256
		SendInput, {Enter}{Down}
	}
}



;~ Яндекс — быстрый поиск в интернете - Google Chrome
;~ ahk_class Chrome_WidgetWin_1
;~ ahk_exe chrome.exe
;~ ahk_pid 10024

;~ [Логины/аккаунты] Логины для Битрикса - Google Таблицы - Google Chrome
;~ ahk_class Chrome_WidgetWin_1
;~ ahk_exe chrome.exe
;~ ahk_pid 10024


End::
{
reload
Return
}

Home::pause