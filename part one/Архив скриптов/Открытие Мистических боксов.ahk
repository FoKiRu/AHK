End::
 	reload
	Return

Numpad1::
{
 imgFound := false
 while(imgFound = false)
 {
  imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, box.png
  if(V)
  {
   click, %x%, %y%
   Sleep 500
   imgFound := true
   Sleep 500
   imageSearch, x, y , 633, 227, 979, 483, pod.png
   click, %x%, %y%
  }
 }
return
}