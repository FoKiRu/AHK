#SingleInstance,force


; Скрипт для фильтрации текста из буфера обмена

Numpad1:: ; Горячая клавиша для активации скрипта (Ctrl+C)
	; Активировать окно Excel
    IfWinActive, Сделки - Google Chrome
    {
        SendInput, {Esc}{PgUp}
        Sleep, 1500
    }
	If WinExist("Не отправленные лиды - Excel")
        {
            WinActivate ; Активирует найденное окно.
            Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
            Clipboard :=
            ; Копирование выделенного текста в буфер обмена
            Send, ^c
            ; Ожидание завершения копирования
            ClipWait
            Sleep, 128+128
            ; Получить содержимое буфера обмена
            clipboardContent := Clipboard
            ; Регулярное выражение для поиска шаблона [ПXX]
            if RegExMatch(clipboardContent, "\[[^\]]+\]", match) {
                ; Если найдено совпадение, заменить содержимое буфера обмена
                Clipboard := match
                Send, {down}
            } else {
                ; Если совпадение не найдено, вывести сообщение
                MsgBox, Не найдено совпадение по шаблону [ПXX] 
            }
            Sleep, 128
            Send, !{tab}
            Click 518, 254
            Sleep, 128
            Send, ^{f}
            Sleep, 128
            Send, ^{v}
            Sleep, 500
            ; Поиск цвета FF9632
            PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, 0xFF9632, 0, Fast RGB
            if ErrorLevel = 0  ; Если цвет найден
            {
                MouseClick, left, %Px%, %Py%
                Sleep, 500
            }
        }



return




End::
{
reload
Return
}

Home::pause