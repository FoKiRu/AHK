#SingleInstance,force


; Скрипт выполняет комбинацию +{down 3}^{c} при нажатии на numpad1 и выводит результат в msgbox
Numpad1::
IfWinActive, [ЛидгенБюро] распределение по проектам - Google Таблицы - Google Chrome
{
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
Sendinput, +^{Right}
SendInput, ^{c}
ClipWait
; Получить содержимое буфера обмена
clipboardContent := Clipboard
; Разделение содержимого по табуляции (`Tab` символ)
array2 := StrSplit(clipboardContent, A_Tab)
; Применение регулярного выражения ко второму элементу массива
if RegExMatch(array2[2], "\[[^\]]+\]", match) {
    ; Если найдено совпадение, заменить второй элемент массива
    array2[2] := match
}
; Вывод массива в MessageBox
; MsgBox, % "Элемент 1: " array2[1] "`nЭлемент 2: " array2[2] "`nЭлемент 3: " array2[3]

Sleep, 512

if (array1[2] == array2[2])
{
    Project := True
    ;MsgBox, Совпадение
}
; MsgBox, %Project%


; Разделение элемента первого массива на слова
words1 := StrSplit(array1[7], " ")

; Удаление второго слова
singleWord := words1[1]


singleWord2 := array2[1]

; Проверка наличия singleWord в array2[1]
if InStr(array2[1], singleWord)
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
    Column := StrReplace(array2[3], "`r`n")
    Column1 := StrReplace(array2[4], "`r`n")
    Column2 := StrReplace(array2[5], "`r`n")
    Column3 := StrReplace(array2[6], "`r`n")
    Sendinput, +{space}
    Sendinput, ^{-}
    Sleep, 100
    Sendinput, !{tab}
    Sleep, 512
    Sendinput, %Column%{Right}%Column1%{Right}%Column2%{Right}%Column3%
    Sleep, 512+512
    Send, {down}
    loop 3
    {
        Sleep, 100
        Send, {Left}
    }
}
Else
{
    MsgBox, Проект: %Project%`r`nFIO: %FIO%
}

return



End::
{
reload
Return
}

Home::pause