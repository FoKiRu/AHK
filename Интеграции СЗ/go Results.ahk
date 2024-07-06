
/*
v0.1
Копирует содержимое в буфер, через горячие клавишу и парсит
*/

goResults:  ; Горячая клавиша для активации скрипта, например, Win + Z
{
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
        if (InStr(A_LoopField, "Всего контактов"))
        {
            targetLine := LineNum
            break
        }
    }

global Results ; Инициализация ассоциативного массива для хранения результатов

    if (targetLine > 0)
    {
        NextLineNum0 := targetLine + 7 ; Позвоним ещё раз
        NextLineNum1 := targetLine + 9 ; Ещё не звонили
        NextLineNum2 := targetLine + 13 ; Сотрудники в проекте
        CurrentLine := 0
        Loop, Parse, clipboardData, `n, `r
        {
            CurrentLine++
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
Results["Ещё не звонили"] := RegExReplace(Results["Ещё не звонили"], pattern, "")
Results["Сотрудники в проекте"] := RegExReplace(Results["Сотрудники в проекте"], pattern, "")
ConResult := Floor(Results["Ещё не звонили"] / Results["Сотрудники в проекте"]) ; Считаем хватает ли базы для операторов
        ;~ ; Вывод результатов для проверки
        ;~ for key, value in Results
            ;~ MsgBox, %key%: %value%
			;~ MsgBox, % global Results["Сотрудники в проекте"]
    }
    else
    {
        MsgBox, Строка "Всего контактов" не найдена.
    }
;~ MsgBox % ConResult
return
}