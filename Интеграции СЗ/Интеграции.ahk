#SingleInstance,force

Numpad0::
{
	/*
	Описание скрипты
	Считает сколько есть активных кнопом, создает отдельный массив с координатами(На практике, координаты смещаются)
	Если видет, что только одна кнопка, очищает фильтр и запускает макрос в екселе
	...
	*/
Students := []
PostMessage, 0x50, 0, 0x0409,, A ; Установка английского языка ввода

	while (true) {
	imageSearch, x, y, %x1%, %y1%, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ЧастьАктивКнопки.png
	if (ErrorLevel = 0){
		x1 := x
		y1 := y + 1
		AAB++
		Students[A_Index] := [x1, y1]
	}
	else {
		if (AAB == 1) {
			imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ОчистФильтр.png
				if (ErrorLevel = 0)
					Click %x%, %y%
			SendInput, ^{q}
		}
		if (AAB > 1) {
			SendInput, ^{PgDn} ; Лист1
			Sleep 256+256
			AAB--
			Loop %AAB% {
				Clipboard = ""
				SendInput, {Down}+{Space}^+{+}{Left}{Up}^{c}{Down}{Enter}{Right}{Up}
				Sleep 256
			}
			SendInput, ^{PgUp} ; Sheet1
			Sleep 256+256
			imageSearch, Tx, Ty, %x2%, %y2%, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\blank.png

			for index, element in Students
			{
				imageSearch, x, y, %x2%, %y2%, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ЧастьАктивКнопки.png
					if (ErrorLevel = 0)
						y2 := y + 1
					Click %x%, %y%
					Sleep 64
					MouseMove, -20, 0, 50, R
					Sleep 256
					SendInput, ^{q}
					Sleep 1024+1024+1024+1024
			}
		}
		;~ if (AAB >= 2) {
			;~ for index, element in Students
			;~ {
				;~ x := Students[index][1]
				;~ y := Students[index][2]
					;~ Click %x%, %y%, 2
					;~ Sleep 256
					;~ SendInput, ^+{Q}
					;~ Sleep 1024+1024+1024+1024
			;~ }
		;~ }
		x1 = 0
		y1 = 0
		break
	}
	}

	;~ MsgBox, Есть проблема
Reload
AAB :=
Sleep 32
;Для обхода такого массива можно использовать тот же способ:
;~ for index, element in Students
;~ {
	;~ x := Students[index][1]
	;~ y := Students[index][2]
	;~ if (index == 2)
		;~ Click %x%, %y%
;~ }



;~ MsgBox % AAB

; Сначала нужно проверить теорию поиска. Сначала он ищет по x, потом спускается по y и снова по x
; Правльно? Не-совсем, стандарные координаты начинают поиск с начала
; Сколько кнопок активный, их занести в переменную, чтобы дальше создать строки для заполнения.
}
return

;~ {
	;~ gosub ОтмеченныйПоиск
	;~ gosub ПоискИзображения
	;~ Click 1215, 894
	;~ SendInput {PgDn 3}
	;~ Sleep 256
	;~ Click 762, 884
	;~ Click 762, 963
	;~ Click 1215, 894
	;~ Click 657, 984
	;~ SendInput ^{f}
	;~ Sleep 1024
	;~ SendInput {Enter}
;~ }
;~ return


Numpad1:: ; Выбор по сценарию "Неуспешные"
{

; Создаем пустой объект (ассоциативный массив)
SysScripts := {}

; Добавляем строки в объект
SysScripts[1] := "(выбрать все)"
SysScripts[2] := "(без результата)"
SysScripts[3] := "Недозвон"
SysScripts[4] := "Системная ошибка (системный)"
SysScripts[5] := "Неопознанная ошибка (системный)"
SysScripts[6] := "Номер из черного списка (системный)"



; Перебираем объект и выводим его содержимое
for index, value in SysScripts
{
	SendInput, ^{f}
	Sleep 64
	SendInput, %value%
	ПоискПикселя()
	Sleep 128+64
}
	SendInput,+{Tab 3}{Esc}

	;~ Желательно добавить проверку на поиск (+ещё 17). Данное значение обозначает правильный выбор фильтра.
	SendInput,{Enter}
}
return


ПоискПикселя() {
	while (true) {
		Sleep 128
		PixelSearch, x, y, 1190, 97, 1434, 1047, 0xF89733, 0, Fast RGB
		if (ErrorLevel = 0) {
			Sleep 32
			Click %x%, %y%
		}
		return
	}
}



Numpad2::
{
PostMessage, 0x50, 0, 0x0409,, A
}
return

Numpad3:: ; Удаление сценария и обновление сотрудника
loop 85
{
	global line =

	Clipboard := ""
	SendInput, ^{c}
	ClipWait
	global FIO := Clipboard
	SendInput, ^{PgUp}
	Sleep 128
	Clipboard := ""
	SendInput, ^{c}
	ClipWait
	FIO1 := Clipboard
		if (FIO = FIO1) {
			line++
			DownLine()
			;~ MsgBox, ячейки равны
		} else
			MsgBox, не равны
	DownLine() {
	Clipboard := ""
	SendInput, {Down}
	Sleep 128
	SendInput, ^{c}
	ClipWait
	FIO2 := Clipboard
		if (FIO = FIO2) {
			line++
			DownLine()
			;~ MsgBox, ячейки равны
		}
	}
	SendInput, {up %line%}
	line--
	SendInput, ^{PgDn}
	Sleep 128
	Loop %line% {
	Clipboard = ""
	SendInput, {Down}+{Space}^+{+}{Left}{Up}^{c}{Down}{Enter}{Right}{Up}
	Sleep 256
	}
	SendInput, ^{PgUp}
	Sleep 128
	SendInput, +{Space}+{Down %line%}^{c}{Down %line%}{Down}
	SendInput, ^{PgDn}
	Sleep 128
	SendInput, ^{v}{Down %line%}{Down}
	Sleep 128
}
return


Numpad4::  ; Разработка скрипты, копирует проект вставляет в браузер, а потом сценарий.
arr := {}
arr["[П31] АН Свои Люди Рязань [2]"] := "[П31] АН Свои Люди"
arr["[П2] СС СПБ [Часть 9]"] := "[П2] СевСтолица СПБ"
arr["[П86] Реал Эксперт [2]"] := "[П86] Реал Эксперт"
arr["[П1] ОМР Металл [ЧАСТЬ 8]"] := "[П1] ОМР Металл"
arr["[П5] ABC.DATA: UTC +3 [Часть 4]"] := "[П5] ABC.DATA: РЕГИОНЫ (бывш Ростов)"
arr["[П14] [Н.Д.] ABC.DATA: UTC +3"] := "[Н.Д.] ABC.DATA: РЕГИОНЫ +3"
arr["[П14] [Н.Д.] ABC.DATA: UTC +5+7"] := "[Н.Д.] ABC.DATA: РЕГИОНЫ +5 +7"
arr["[П15] АВС ЗАГРАН [Часть 5]"] := "[П15] ABC ЗАГРАН ( бывший Улыбка Краснодар)"
arr["[П7] Неометрия Облака Новороссийск"] := "[П7] Неометрия Облака Новороссийск"
arr["[П3] Тихомиров НСК"] := "[П3] Тихомиров НСК"
arr["[П17] ABC АВТО МСК+СПБ [1]"] := "[П17] ABC Авто (бывший Рольф Москвич)"
arr["[П48] СП РФ [ЧАСТЬ 2]"] := "Интерглобал СП РФ Проект 2"
arr["[П88] ЦИАН"] := "[П88] ЦИАН"
arr["[П8] Неометрия Ростов"] := "[П8] Неометрия 1799 Ростов"
arr["[П92] ЭКОМТЕХ [1]"] := "[П92] ЭКОМТЕХ"
arr["[ЗВОНКО] Тестовый день ОМР Металл"] := "[П1] ОМР Металл"
arr["[П93] Сп-Север [1]"] := "[П93] Сп-Север"
arr["[П106] ГлавМазТорг"] := "[П106] ГЛАВМАЗТОРГ"
arr["[П112] АВТОСИЛА"] := "[П112] АВТОСИЛА"
arr["[П37] РТА Спецтехника"] := "[П37] РТА Спецтехника"
arr["[П37] РТА ДОБАВКА"] := "[П37] РТА Спецтехника ДОБАВКА"
arr["[П96] Дельта-Техно РФ [1]"] := "[П96] Дельта-Техно РФ"
arr["[П113] ТТМ Центр Саратов"] := "[П113] ТТМ Центр Саратов"
arr["[П84] ПромСпецАвто РФ"] := "[П84] ПромСпецАвто РФ"
arr["[П115] Еврокара УФА"] := "[П115] Еврокара УФА"
arr["[П87] Все станки РФ"] := "[П87] Все станки РФ"
arr["[П4] Алиро Окна Краснодар [Часть 3]"] := "[П4] Алиро Окна Краснодар "
arr["[П50] АН1 НСК [Часть 3]"] := "[П50] АН1 НСК [Проект 4]"
arr["[П2] СС СПБ [Часть 10]"] := "[П2] СевСтолица СПБ"
arr["[П109] КОМИТРАК"] := "[П109] КОМИТРАК"
arr["[П101] ПРОФБИЗНЕССТАЛЬ [1]"] := "[П101] ПРОФБИЗНЕССТАЛЬ"
arr["[П118] Ремарка ЕКБ"] := "[П118] Ремарка ЕКБ"
arr["[П98] МетКон СП [1]"] := "[П98] МетКон СП"
arr["[П114] ИЛПРА РУС"] := "[П114] ИЛПРА РУС"
arr["[П117] ПневмоТек Компрессоры"] := "[П117] ПневмоТек"
arr["[П95] ВИЛКАГРУПП [1]"] := "[П95] ВИЛКАГРУПП"
arr["[П116] RED Инжиниринг"] := "[П116] RED Инжиниринг"
arr["[П82] Машсервис электроэроз станки [1]"] := "[П82] Машсервис электроэроз станки"
arr["[П49] Пакка Линии Розлива [2]"] := "[П49] Пакка Линии Розлива [Проект 3]"
arr["[П1] ОМР Металл [ЧАСТЬ 9]"] := "[П1] ОМР Металл"
arr["[П121] Техника Групп"] := "[П121] Техника Групп"
arr["[П119] АмурСтройТехника"] := "[П119] АмурСтройТехника"



;~arr[""] := ""


ClipboardProject := ""
	; Активировать окно Excel
	If WinExist("Черновик.xlsx - Excel")
	{
		WinActivate ; Активирует найденное окно.
		Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
		Clipboard :=
		SendInput, ^{c}
		ClipWait
		Clipboard := StrReplace(Clipboard, "`r`n")
		if (Clipboard = "")
			return
		key := Clipboard ; Инициализация переменной key
		value := arr[key] ; Получение значения из массива по ключу
		value := StrReplace(value, "+", "{+}")
		if (value = "")
			MsgBox, Ошибка, нет сценария. Требуется доабвить в массив!
			;~ MsgBox, % "Ключ: " key "`nЗначение: " value
		Sleep, 500/2
	}
	else
	{
		MsgBox, Окно Excel не найдено.
		return
	}

	If WinExist("Скорозвон - Google Chrome")
	{
		WinActivate
		Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
		;~ Send, ^{2} ; Отправить Ctrl+F для открытия поиска.
		;~ Sleep, 1500 ; Пауза для открытия поля поиска.
		; Проект
		{
			MouseClick, left, 1234, 453 ; шторка проекта
			Sleep 100
			MouseClick, left, 1397, 500 ; крестик в строке
			Sleep 100
			MouseClick, left, 1234, 500 ; сама строка
			Sleep 100
			SendInput, ^{v}
			Sleep 200/2
			MouseClick, left, 1234, 529 ; выбор первого поиска
		}
		; Сценарий
		{
			MouseClick, left, 1234, 562 ; шторка сценария
			Sleep 100
			MouseClick, left, 1397, 603 ; крестик в строке
			Sleep 100
			MouseClick, left, 1234, 603 ; сама строка
			Sleep 100
			SendInput, %value%
			Sleep 200/2
			MouseClick, left, 1234, 634 ; выбор первого поиска
			Sleep 500+100
			imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ВсеРезультаты.png
			if (ErrorLevel = 0)
				MouseClick, left, 1234, 651 ; Все результаты
		}
	}
	else
	{
		MsgBox, Окно Chrome не найдено.
		return
	}
Sleep 256
gosub Numpad1
return


Numpad5::
imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ПустойСписок.png
if (ErrorLevel != 0)
{
	SendInput +{Space} ; {PgUp}
	Sleep 128
	imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\on-page.png
	if (ErrorLevel != 0)
		Click 501, 191 ; Установка флага
	Click 704, 190 ; Добавить в проект
	Sleep 128+128
	Send {Tab}проброс
	Sleep 128+128
	Click 740, 294
	Sleep 500/2
	while(true) {
		Sleep 64
		PixelSearch, x, y, 659, 402, 1277, 455, 0xEBF7FF, 2, Alt RGB
		if (ErrorLevel = 0) {
				ДобавитьВПроект()
				ResultsVar := ДобавитьВПроект()
				Sleep 128
				Click 848, 614
				SendInput +{Down}^{c}
				Sleep 128
				CleanedString := StrReplace(Clipboard, """", "")
				Sleep 128
				SendInput {Tab 2}{Enter}
				Sleep 128
				;~ MsgBox, % ResultsVar
				If WinExist("Черновик.xlsx - Excel")
					{
					;~ ResultsVar := ДобавитьВПроект()
					WinActivate ; Активирует найденное окно.
					Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
					Send, {Right 9}
					Loop, 3
					{
						Clipboard := ""
						Sleep, 100
						Send, ^c
						Sleep, 100
						; Проверка содержимого буфера обмена
						if (Clipboard >= 0)
							SendInput,{Right} ; Если буфер обмена не пуст, переместить ячейку вправо
						else
						{
							; Если буфер обмена пуст, выполнить действия и завершить цикл
							Clipboard := ResultsVar
							Sleep, 100 ; Небольшая пауза перед использованием буфера обмена
							SendInput, %Clipboard%{Left %A_Index%}{Left 8}^{c}
							break
						}
					}
						Sleep, 500 ; Пауза для завершения операции копирования.
					}
				Clipboard := SubStr(CleanedString, InStr(CleanedString, "[") + 1, InStr(CleanedString, "]") - InStr(CleanedString, "[") - 1)
				If WinExist("Скорозвон - Google Chrome")
					{
						WinActivate
						Sleep 100
						SendInput, ^{Tab}
						Sleep 100+100
						imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ПроектПроброс.png
						if (ErrorLevel = 0) {
							Click 501, 191 ; Установка флага
							Click 704, 190 ; Добавить в проект
							Sleep 128+128
							Send {Tab}^{v}
							Sleep 256+128
							Click 704, 294
							ProjectFun()
						}
					}
				break
		}
	}
}
else
{
	If WinExist("Черновик.xlsx - Excel") {
		;~ ResultsVar := ДобавитьВПроект()
		WinActivate ; Активирует найденное окно.
		Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
		Send, {Right 9}
		Loop, 3
		{
			Clipboard := ""
			Sleep, 100
			Send, ^c
			Sleep, 100
			; Проверка содержимого буфера обмена
			if (Clipboard >= 0)
				SendInput,{Right} ; Если буфер обмена не пуст, переместить ячейку вправо
			else
			{
				; Если буфер обмена пуст, выполнить действия и завершить цикл
				Clipboard := 0
				Sleep, 100 ; Небольшая пауза перед использованием буфера обмена
				SendInput, %Clipboard%{Left %A_Index%}{Left 8}^{c}
				break
			}
		}
			Sleep, 500 ; Пауза для завершения операции копирования.
	}
	Clipboard := SubStr(CleanedString, InStr(CleanedString, "[") + 1, InStr(CleanedString, "]") - InStr(CleanedString, "[") - 1)
	If WinExist("Скорозвон - Google Chrome") {
		WinActivate
		Sleep 100
		SendInput, ^{Tab}
		Sleep 100+100
		imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\ПроектПроброс.png
		if (ErrorLevel = 0) {
			Click 501, 191 ; Установка флага
			Click 704, 190 ; Добавить в проект
			Sleep 128+128
			Send {Tab}^{v}
			Sleep 256
			Click 704, 294
			ProjectFun()
		}
	}
}
return

; Требуется функция, которая будет проверять проект из таблицы с ДОБАВЛЕНИЕ В ПРОЕКТ
ProjectFun()
{
Sleep 256+256+256
project := Clipboard
Clipboard :=
SendInput, ^{a}^{c}
ClipWait
SendInput, {Down}
LineNum := 0
CurrentLine := 0
trimmedResult := ""
clipboardData := Clipboard  ; Считывание содержимого буфера обмена
Loop, Parse, clipboardData, `n, `r
{
	LineNum++
	if (InStr(A_LoopField, "Добавить контакты в проект "))
	{
		; Исходная строка
		originalString := A_LoopField

		if RegExMatch(originalString, "\[[^\]]+\] [^']+", matchedPart)
		{
		; Убираем лишние символы " и:
		trimmedResult := RegExReplace(matchedPart, "[' и:]+$")
		; Удаляем последний символ справа
		trimmedResult := SubStr(trimmedResult, 1, -1)
		}

		;~ trimmedResult := SubStr(CleanedString, InStr(CleanedString, "[") + 1, InStr(CleanedString, "]") - InStr(CleanedString, "[") - 1)
		break
	}
}

if RegExMatch(trimmedResult, "\[П\d+\]", Match)
    ; Убираем квадратные скобки из найденного значения
    trimmedResult := SubStr(Match, 2, -1)


if (trimmedResult == project)
{
	Sleep 128
	Click 848, 614
	SendInput +{Down}^{c}
	Sleep 128
	Sleep 128
	SendInput {Tab 2}{Enter}
	Sleep 128
	If WinExist("Черновик.xlsx - Excel") {
	WinActivate ; Активирует найденное окно.
	Sleep, 300
	Send, {Down}
	}
	If WinExist("Скорозвон - Google Chrome") {
	WinActivate
	Sleep 100
	SendInput ^{2}
	}
	;~ MsgBox, Проект совпал
}
else
	{
	Sleep 128
	Click 848, 614
	SendInput +{Down}^{c}
	Sleep 128
	Sleep 128
	SendInput {Tab}{Enter}
	MsgBox, %trimmedResult%, %project%
}

return Clipboard := project
}

УдалениеСкобок()
{
; Исходная строка
originalString := str

; Подсчитываем количество символов [
count := 0
Pos := 0

Loop
{
    Pos := InStr(originalString, "[", false, Pos + 1)
    if (!Pos)
        break
    count++
}

; Если найдено два символа [
if (count = 2)
{
    ; Находим позицию второго символа [
    Pos := InStr(originalString, "[", false, InStr(originalString, "[") + 1)

    ; Удаляем один символ перед вторым вхождением [
    Pos -= 1

    ; Обрезаем строку
    trimmedResult := SubStr(originalString, 1, Pos - 1)

    ; Показываем результат
    ;~ MsgBox, Результат: %trimmedResult%
}
else
{
    MsgBox, Найдено %count% символов [
}
return trimmedResult
}

ProjectProbros()
{
	;~ Click 1288, 428                ; Установить курсор после надписи "Проекты"
	;~ SendInput {Right}+{Down}^{c}   ; Спустится вниз и скопировать текст
	Click 1294, 456                ; Активация кнопки "Проект"
	Click 1297, 499				   ; Активация поля ввода
	Send Проект					   ; ВВод текста
	Sleep 128+64
	Click 1301, 536				   ; Клик по первого, выдавщему результату
	SendInput ^+{Right 3}
}




ПоискИзображения: ;
while (true) {
	sleep 128
	imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\Сотрудники.png
	if (ErrorLevel = 0){
		;MsgBox, OK
		x += 300
		Click %x%, %y%
		y += 76
		Click %x%, %y%
	break
	}
}
Return


ОтмеченныйПоиск: ;
while(true) {
	Sleep 64
	PixelSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xF89733, 0, Fast RGB
	if (ErrorLevel = 0)
		Click %x%, %y%
	break
}
Return

Numpad6::
Loop {
	Clipboard := ""
	; Активировать окно Excel
	If WinExist("Черновик.xlsx - Excel")
	{
		WinActivate ; Активирует найденное окно.
		Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
		SendInput, ^{c} ; Отправить Ctrl+C для копирования данных.
		ClipWait
		Clipboard := StrReplace(Clipboard, "`r`n")
		if (Clipboard = "") {
			SendInput, ^{up 3}{Right 5}Ещё не{Right}Ещё{Right}Сотр.{Right}Ср. зв. Сотр.{Right}П. н.д.{Right}П. д.з.{Right}П ещё раз
			break
		}
		Sleep, 500
	}
	else
	{
		MsgBox, Окно Excel не найдено.
		return
	}

	; Активировать окно Chrome
	If WinExist("Скорозвон - Google Chrome")
	{
		WinActivate
		Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
		Send, ^f ; Отправить Ctrl+F для открытия поиска.
		Sleep, 500 ; Пауза для открытия поля поиска.
		Send, ^v{Enter} ; Вставить скопированный текст.
		Sleep, 500
		; Поиск цвета F89733
		PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xF89733, 0, Fast RGB
		if ErrorLevel = 0  ; Если цвет найден
		{
			MouseClick, left, %Px%, %Py%
			Sleep, 500
		}
		else
		{
			; Если цвет F89733 не найден, ищем цвет FDFF20
			PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xFDFF20, 0, Fast RGB
			if ErrorLevel = 0
			{
				MouseClick, left, %Px%, %Py%
				Sleep, 500
			}
			else
			{
				PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xFBCB99, 0, Fast RGB
				if ErrorLevel = 0
				{
					MouseClick, left, %Px%, %Py%
					Sleep, 500
				}
				else
					MsgBox, Цвета FBCB99, F89733 или FDFF20 не найдены.
			}
		}
	}
	else
	{
		MsgBox, Окно Chrome не найдено.
		return
	}

Clipboard :=
    SendInput, ^{a}^{c}
    ClipWait
    SendInput, {Down}
    clipboardData := Clipboard  ; Считывание содержимого буфера обмена

    ; Разбивка содержимого буфера на строки
    LineNum := 0
    Loop, Parse, clipboardData, `n, `r
    {
        LineNum++
		if (InStr(A_LoopField, "СОСТОЯНИЕ ПРОЕКТА"))
        {
            targetLine0 := LineNum
			targetLine0 += 2 ; строка названия проекта
        }
        if (InStr(A_LoopField, "Всего контактов"))
        {
            targetLine := LineNum
            break
        }
    }

Results := [] ; Инициализация ассоциативного массива для хранения результатов

    if (targetLine > 0)
    {
        NextLineNum0 := targetLine + 7 ; Позвоним ещё раз
        NextLineNum1 := targetLine + 9 ; Ещё не звонили
        NextLineNum2 := targetLine + 13 ; Сотрудники в проекте
        CurrentLine := 0
        Loop, Parse, clipboardData, `n, `r
        {
            CurrentLine++
			if (CurrentLine = targetLine0)
            {
                ProjectStatus := StrReplace(A_LoopField, "+", "{+}")
            }
            if (CurrentLine = NextLineNum0)
            {
                Results["Позвоним ещё раз"] := A_LoopField
            }
            if (CurrentLine = NextLineNum1)
            {
                Results["Ещё не звонили"] := A_LoopField
            }
            if (CurrentLine = NextLineNum2)
            {
                Results["Сотрудники в проекте"] := A_LoopField
                break  ; Прерывание цикла после нахождения всех нужных строк
            }
        }

;~ originalText := "52 (5%)"
;~ resultText := RegExReplace(originalText, pattern, "")  ; Заменяем найденные совпадения на пустую строку

;~ MsgBox, % "Original: " originalText "`nResult: " resultText

pattern := "\s*\([^)]*\)"  ; Регулярное выражение для поиска скобок и их содержимого
Results["Позвоним ещё раз"] := RegExReplace(Results["Позвоним ещё раз"], pattern, "")
; Проверка значения и изменение, если нужно
if (Results["Позвоним ещё раз"] == "получаем данные")
	Results["Позвоним ещё раз"] := 0
Results["Ещё не звонили"] := RegExReplace(Results["Ещё не звонили"], pattern, "")
Results["Сотрудники в проекте"] := RegExReplace(Results["Сотрудники в проекте"], pattern, "")
ConResult := Floor(Results["Ещё не звонили"] / Results["Сотрудники в проекте"]) ; Считаем хватает ли базы для операторов
	If WinExist("Черновик.xlsx - Excel")
	{
		WinActivate ; Активирует найденное окно.
		Sleep, 32
		SendInput, %ProjectStatus%{Right 5}
		Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
        ;~ ; Ввод результатов
        for key, value in Results
			SendInput, %value% {Right}
            ;~ MsgBox, %key%: %value%
		SendInput, %ConResult% {Left 8}{Down}
		Sleep, 500 ; Пауза для завершения операции копирования.
	}
    }
    else
    {
        MsgBox, Строка "Всего контактов" не найдена.
    }
SetTitleMatchMode, 2  ; Настройка поиска окна по части заголовка
If WinExist("Google Chrome")  ; Убедиться, что Google Chrome открыт
{
    WinActivate  ; Активировать окно браузера
    Sleep, 500
    IfWinNotExist, DevTools - app.skorozvon.ru
        Send, {F12}  ; Открыть консоль разработчика (Ctrl+Shift+J в Chrome)
    else
        WinActivate
    Sleep, 1000
    oldClipboard := ClipboardAll  ; Сохранить текущее содержимое буфера обмена
    command := "var closeButton = document.querySelector('.do-close'); if (closeButton) {closeButton.click()} else { console.log('The element to close was not found.'); }"
    Clipboard := command  ; Копирование скрипта в буфер обмена
    Send, ^v  ; Вставить скрипт из буфера обмена в консоль разработчика
    Send, {Enter}
    Sleep, 500
    Clipboard := oldClipboard  ; Восстановить исходное содержимое буфера обмена
    Send, {F12}  ; Закрыть консоль разработчика
	Sleep, 500
}
else
{
    MsgBox, Google Chrome не найден.
}
}
return



ДобавитьВПроект()
{
    Loop
    {
        ; Выделение всего текста и копирование
        SendInput, ^{a}^{c}{Right}{Down} ; Выделение всего текста
        ;~ Sleep, 100 ; Пауза, чтобы текст успел выделиться

        ; Получение текста из буфера обмена
        ClipSaved := ClipboardAll ; Сохранение текущего содержимого буфера обмена
        Clipboard := "" ; Очистка буфера обмена
        ClipWait, 1 ; Ожидание заполнения буфера обмена
        clipboardData := Clipboard  ; Считывание содержимого буфера обмена
        Clipboard := ClipSaved ; Восстановление предыдущего содержимого буфера обмена


		; Разбивка содержимого буфера на строки
		LineNum := 0
		Loop, Parse, clipboardData, `n, `r
		{
			LineNum++
			if (InStr(A_LoopField, "ДОБАВЛЕНИЕ В ПРОЕКТ"))
			{
				targetLine := LineNum
				break
			}
		}
		Results := [] ; Инициализация ассоциативного массива для хранения результатов

		if (targetLine > 0)
		{
			NextLineNum0 := targetLine + 1 ; Выбрано контактов:
			NextLineNum1 := targetLine + 5 ; удалить из проекта
			CurrentLine := 0
			Loop, Parse, clipboardData, `n, `r
			{
				CurrentLine++
				if (CurrentLine = NextLineNum0)
				{
					if RegExMatch(A_LoopField, "\d+(\s*\d+)*", match)
						Results["Выбрано контактов:"] := StrReplace(match, " ", "")
						;~ ResultsVar := Results["Выбрано контактов:"]
					;~ MsgBox, % Results["Выбрано контактов:"]
				}
				if (CurrentLine = NextLineNum1)
				{
					Results["удалить из проекта"] := A_LoopField
					;~ MsgBox, % Results["удалить из проекта"]
					break  ; Прерывание цикла после нахождения всех нужных строк
				}
			}
			;~ Results["Выбрано контактов:"] := RegExReplace(Results["Позвоним ещё раз"], pattern, "")
			;~ Results["удалить из проекта"] := RegExReplace(Results["Ещё не звонили"], pattern, "")
		}
        else
        {
            Sleep, 2000
        }
		if (Results["Выбрано контактов:"] >= 0)
			break
    }
	return Results["Выбрано контактов:"]
}
return

Numpad8::
{
	ResultsVar := 100
	Clipboard := ""
SendInput, ^{c}
ClipWait, 1
if (Clipboard >= 0) {
	SendInput, {Right}
	Clipboard := ResultsVar
	Sleep, 100 ; Небольшая пауза перед использованием буфера обмена
	SendInput, %Clipboard%{Left}
}
}
return

End::
{
reload
Return
}

Home::pause