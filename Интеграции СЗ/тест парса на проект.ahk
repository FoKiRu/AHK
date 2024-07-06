#SingleInstance,force
Numpad0::
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

		if RegExMatch(originalString, "\[[^\]]+\] [^']+", matchedPart) {
		; Убираем лишние символы " и:
		trimmedResult := RegExReplace(matchedPart, "[' и:]+$")
		; Удаляем последний символ справа
		trimmedResult := SubStr(trimmedResult, 1, -1)
		}
		break
	}
}
if (trimmedResult == project)
	MsgBox, Проект совпал
else
	MsgBox, %trimmedResult%, %project%
} return


Numpad1::
{
; Исходная строка
originalString := "[П92] ЭКОМТЕХ [1]"

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


	trimmedResult := SubStr(CleanedString, InStr(CleanedString, "[") + 1, InStr(CleanedString, "]") - InStr(CleanedString, "[") - 1)

    ; Показываем результат
    MsgBox, Результат: %trimmedResult%
}
else
{
    MsgBox, Найдено %count% символов [
}


return
}