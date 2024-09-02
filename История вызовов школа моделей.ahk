#SingleInstance, force

; Начальные даты
date0 := "20240820" ; Формат даты: ГГГГММДД

; Функция увеличения даты на один день
IncrementDateByOneDay()
{
    global date0, formatted_date0, formatted_date1

    ; Увеличиваем дату на 1 день
    date0 += 1, Days

    ; Форматируем дату и извлекаем компоненты (день, месяц, год)
    FormatTime, day, %date0%, d
    FormatTime, month, %date0%, M
    FormatTime, year, %date0%, yyyy

    ; Собираем дату в нужном формате без лидирующих нулей
    formatted_date0 := day . "." . month . "." . year . ", 0:00:00"
    formatted_date1 := day . "." . month . "." . year . ", 23:59:59"
}

; Горячая клавиша для увеличения даты на один день
Numpad1::
    IncrementDateByOneDay()
    If WinExist("PBX RunTel - Google Chrome")
    {
        WinActivate ; Активирует найденное окно.
        Sleep, 500 ; Пауза для обеспечения времени на активацию окна.
        Click 427, 329
        Sleep, 128
        SendInput, ^{a}%formatted_date0%
        Sleep, 128
        SendInput, {Tab 2}%formatted_date1%
        Click 1211, 182
    }
Return

End::reload
Home::pause
