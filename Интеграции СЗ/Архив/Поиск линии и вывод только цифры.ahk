#z::  ; Горячая клавиша для активации скрипта, например, Win + Z
    clipboardData := Clipboard  ; Считывание содержимого буфера обмена

    ; Разбивка содержимого буфера на строки
    Loop, Parse, clipboardData, `n, `r
    {
        ; Проверка наличия искомого текста в строке
        if (InStr(A_LoopField, "Выбрано контактов: "))
        {
            ; Извлечение чисел из строки
            RegExMatch(A_LoopField, "Выбрано контактов: (\d+)", matches)
            if (matches1 != "")
            {
                MsgBox, % "Найдено контактов: " matches1
            }
            else
            {
                MsgBox, % "Цифры не найдены в строке: " A_LoopField
            }
        }
    }
return
