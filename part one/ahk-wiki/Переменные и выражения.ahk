#SingleInstance,force

/*
bool_val := true

;Здесь мы при нажатии 1 инвертируем значение переменной
1::
ToolTip, bool_val содержал значение %bool_val%
bool_val := !bool_val
Return
*/

/*
numeric_val := 0

;Здесь мы при нажатии 1 добавляем 10 к значению переменной
2::
ToolTip, numeric_val содержал значение %numeric_val%
numeric_val += 10

Return
*/

/*
string:="Валера"
string.=" - гений кодинга"
StringReplace, string, string, ний
string := SubStr(string, 1, 12)
MsgBox, %string%
*/

myVar := "Привет, мир!"
myVar := SubStr(myVar, 1, 2)
MsgBox % myVar
