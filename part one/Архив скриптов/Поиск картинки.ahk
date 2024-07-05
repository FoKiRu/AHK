End::
 	reload
	Return

^d::
imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\NWOC.png ; A_ScreenWidth, A_ScreenHeight
   Sleep 64
   MouseMove, %x%, %y%
   MouseMove, 10, 10,,R
   MsgBox The icon was found at %x%x%y%.
return