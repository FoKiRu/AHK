

Numpad1::
Gosub, test
Return



test: ;
{
imageSearch, xADR, yADR, 1468, 900, 1916, 946, C:\Users\WIKI\Desktop\Script\Image\PageSquare\ADR.png ; Стрелка напраление ">"
 if ErrorLevel = 0
  MouseClick, left, %xADR%, %yADR%
Return
}



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