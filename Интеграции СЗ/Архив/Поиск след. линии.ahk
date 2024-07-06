#Persistent  ; Делает скрипт постоянно работающим

ClipWait, 10  ; Ждет, пока буфер обмена изменится или истечет 10 секунд

return  ; Завершает автоматический запуск

#z::  ; Горячая клавиша для активации скрипта, например, Win + Z
    clipboardData := Clipboard  ; Считывание содержимого буфера обмена

    ; Разбивка содержимого буфера на строки
    LineNum := 0
    Loop, Parse, clipboardData, `n, `r
    {
        LineNum++
        if (InStr(A_LoopField, "Ещё не звонили"))
        {
            targetLine := LineNum
            break
        }
    }

    if (targetLine > 0)
    {
        NextLineNum := targetLine + 1  ; Вычисление номера следующей строки
        CurrentLine := 0
        Loop, Parse, clipboardData, `n, `r
        {
            CurrentLine++
            if (CurrentLine = NextLineNum)
            {
                MsgBox, Следующая строка: %A_LoopField%
                break
            }
        }
    }
    else
    {
        MsgBox, Строка "Ещё не звонили" не найдена или это последняя строка.
    }
return
