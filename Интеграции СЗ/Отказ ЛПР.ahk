#SingleInstance,force

xdwa := 102

Numpad0::
{
	SendInput, {PgUp 2}
	Sleep 100
	Click 704, 229
Sleep 50
Click 704, 272
SendInput, [П%xdwa%]
;~ Sleep 150
;~ Click 704, 302
;~ Sleep 1000
;~ SendInput, {PgDn}
	xdwa ++
}
return


Numpad1::
Loop
{
	Sleep 2000
	gosub Numpad4
	Sleep 500
Reasons := ["Отказ ЛПР: не подходит KPI", "Отказ ЛПР: не целевой", "Отказ ЛПР: уже купили", "Отказ ЛПР: не интересовался", "Отказ ЛПР: отложил на неопределенный срок", "Отказ ЛПР: был интерес, передумал", "Отказ ЛПР: бросил трубку", "Дубль", "Лид не принят ОКК"]
Index := 1
Loop
{
SendInput,^{f}
Sleep 100
SendInput,добавить
Sleep 100
	PixelSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xF89733, 0, Fast RGB
	if ErrorLevel = 0  ; Если цвет найден
	{
		Index := A_Index
		Index1 := Reasons[A_Index]
		SendInput, {Esc}
		Sleep, 50
		Click, %x%, %y%
		Sleep, 100
		SendInput, %Index1%
		Sleep 100
		x += 90
		y += 8
		Click, %x%, %y%
		x += 47
		y += 21
		Click, %x%, %y%
	}
if (A_Index >= 9) {
	SendInput, +{Tab 15}{Enter}
	Click 1621, 257
	break
}
}
xdwa ++
Sleep 1000
Click 704, 229
Sleep 50
Click 704, 272
SendInput, [П%xdwa%]
Sleep 50
Click 704, 302
}
return


Numpad4::
SendInput, {PgDn 2}
Sleep 200
loop
{
PixelSearch, x, y, 431, 436, 1181, 714, 0xC66633 , 0, Fast RGB
if (ErrorLevel = 0) {
	x += 21
	y -= 21
	Sleep 32
	Click %x%, %y%
	Sleep 32
}
else break
}
return



End::
{
reload
Return
}

Home::pause