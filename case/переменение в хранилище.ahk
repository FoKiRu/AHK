#SingleInstance,force
SetdefaultMouseSpeed, 0

Numpad1::
x := 193
y := 208
xR := 192
yD := 190
xPC := 9
yPC := 5
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 193
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 193
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 193
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
Click WheelDown, 10
Return


/*
Обноаление разметки кейсов
Начало
193 x 208
Шаг вправо
192
26 ширина
64 высота
166 x 126 разме бокса

*/

; 83 x 60.5
; 166 x 121 размер бокса
; 26 ширина
; 97 высота
; 288, 320 координаты первого кейса
; 26+166=192 сдвиг пикселей вправо
; 97+121=218

/*
Numpad1::
x := 288
y := 320
xR := 192
yD := 218
xPC := 8
yPC := 4
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 288
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 288
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
x := 288
y := y + yD
loop %xPC%
{
Click %x% %y%
x := x + xR
}
Click WheelDown, 9
Return

; 83 x 60.5
; 166 x 121 размер бокса
; 26 ширина
; 97 высота
; 288, 320 координаты первого кейса
; 26+166=192 сдвиг пикселей вправо
; 97+121=218
*/




End::
{
reload
Return
}

Home::
{
pause
Return
}