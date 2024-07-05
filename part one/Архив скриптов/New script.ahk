Numpad1::
Gosub, test
Return



test: ;
{
imageSearch, xbuyer, ybuyer, 44, 395, 973, 848, C:\Users\WIKI\Desktop\Script\Image\buyer.png ;
 if ErrorLevel = 0
 {
  MouseMove, %xbuyer%, %ybuyer%
  MouseClickDrag, Left, 0, 0, 800, 100, ,R
  Sendinput,^{c}
 }
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