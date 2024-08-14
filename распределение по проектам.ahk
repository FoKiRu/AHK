#SingleInstance,force




; Скрипт выполняет комбинацию +{down 3}^{c} при нажатии на numpad1 и выводит результат в msgbox
Numpad1::
If WinExist("[ЛидгенБюро] распределение по проектам - Google Таблицы - Google Chrome")
{
    WinActivate ; Активирует найденное окно.
    Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
    Clipboard := 
    Sendinput, +{left}+^{left}
    SendInput, ^{c}
    ClipWait
    clipboardContent := Clipboard
    array1 := StrSplit(clipboardContent, A_Tab)
    ; Применение регулярного выражения ко второму элементу массива
    if RegExMatch(array1[2], "\[[^\]]+\]", match) {
        ; Если найдено совпадение, заменить второй элемент массива
        array1[2] := match
    }
    ; MsgBox, % "Элемент 1: " array1[2] "`nЭлемент 2: " array1[7] "`nЭлемент 3: " array1[8]
}

Sendinput, !{tab}
Sleep, 512

Clipboard :=
Sendinput, ^{Left}
SendInput, +^{Right}
SendInput, ^{c}
ClipWait
; Получить содержимое буфера обмена
clipboardContent := Clipboard
; Разделение содержимого по табуляции (`Tab` символ)
array2 := StrSplit(clipboardContent, A_Tab)
; Применение регулярного выражения ко второму элементу массива
if RegExMatch(array2[3], "\[[^\]]+\]", match) {
    ; Если найдено совпадение, заменить второй элемент массива
    array2[3] := match
}
; Вывод массива в MessageBox
; MsgBox, % "Элемент 1: " array2[1] "`nЭлемент 2: " array2[2] "`nЭлемент 3: " array2[3]

Sleep, 512

if (array1[1] == array2[1])
{
    if (array1[2] == array2[3])
    {
        Project := True
       ; MsgBox, Совпадение
    } Else {
        MsgBox, Проект не совпал
        Reload
    }
; MsgBox, %Project%
} Else {
    MsgBox, Дата не совпала 
    Reload
}




; Разделение элемента первого массива на слова
words1 := StrSplit(array1[5], " ")

; Удаление второго слова
singleWord := words1[1]


singleWord2 := array2[2]

; Проверка наличия singleWord в array2[1]
if InStr(array2[2], singleWord)
{
    FIO := True
    ; Если найдено совпадение, вывод результата
    ; MsgBox, Совпадение найдено: %singleWord% в %array2[1]%
}
else
{
    MsgBox, Нет совпадения для: %singleWord% %singleWord2%
    Reload
}

if Project and FIO
{
    Column := StrReplace(array2[4], "`r`n")
    ; Column1 := StrReplace(array2[5], "`r`n")
    ; Column2 := StrReplace(array2[6], "`r`n")
    ; Column3 := StrReplace(array2[7], "`r`n")
    Sendinput, +{space}
    Sendinput, ^{-}{Up}
    Sleep, 100
    Sendinput, !{tab}
    Sleep, 512
    Sendinput, %Column% ;{Right}%Column1%{Right}%Column2%{Right}%Column3%
    Sleep, 512+512
    Send, {down}
    ;loop 1
    ;{
    ;    Sleep, 100
    ;    Send, {Left}
    ;}
}
Else
{
    MsgBox, Проект: %Project%`r`nFIO: %FIO% 
}

return


Numpad2::
{
    If WinExist("Calls total 30.06.2024—21.07.2024 - Excel")
{
    WinActivate ; Активирует найденное окно.
    Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
    Click 613, 247
    SendInput, {Up 3}{Space}{Down}{Space}{Enter}
    Sleep, 256+256
    SendInput, ^{up 2}{Down}^{c}
}
}
Return

Numpad3::
{
    SendInput, ^{up 2}{down}+^{down}+{Space}^{-}
    Click 613, 247
    Sleep, 512
    imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WiKi\Pictures\AHK\ВыделитьВсе.png
        if (ErrorLevel = 0){
            Click -11, -6
            Sleep, 128
            Click 344, 245
            Sleep, 512
            SendInput, {Up 2}{down}{Space}{Enter}
        } Else {
            SendInput, {Up 2}{down}{Space}{Enter}
            Sleep, 512
            SendInput, ^{up 2}{Down}
            Sleep, 512
            SendInput, ^{c}
            Sleep, 128
            If WinExist("[ЛидгенБюро] распределение по проектам - Google Таблицы - Google Chrome")
            {
                WinActivate ; Активирует найденное окно.
                Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
                Click 317, 343
                Sleep, 256+256
                SendInput, {Tab 5}{Space}{Tab}^{v}
            }
        }

}
Return




/*
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
*/


End::
{
reload
Return
}

Home::pause