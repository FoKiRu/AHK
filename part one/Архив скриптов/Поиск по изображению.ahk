End::
 	reload
	Return

^d::
{
 imgFound := false
 while(imgFound = false)
 {
  imageSearch, x, y, 23, 594, 164, 654, img.png ; A_ScreenWidth, A_ScreenHeight
  if(x тут скобки угловые "")
  {
   Sleep 64
   MouseMove, %x%, %y%
   MouseMove, 36, 13,,R
   imgFound := true
   MsgBox The icon was found at %x%x%y%.
  }
 }
return
}