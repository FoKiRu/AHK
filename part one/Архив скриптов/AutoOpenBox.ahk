End::
 	reload
	Return

Numpad1::
{
 imgFound := 0
 while(imgFound = 0)
 {
  imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, box.png
  if(x)
  {
   Sleep 64
   Click, %x%, %y%
	imgFound := 1
  }
 }
return
}

Numpad2::
{
 imgFound1 := 0
 while(imgFound1 = 0)
 {
  imageSearch, x1, y1, 0, 0, A_ScreenWidth, A_ScreenHeight, pod.png
  if(x)
  {
   Sleep 64
   Click, %x1%, %y1%
	imgFound1 := 1
  }
 }
return
}


Numpad3::
{
 imgFound := 0
 imgFound1 := 0
 while(imgFound = 0)
 {
  imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, box.png
  if(x)
  {
   Sleep 64
   Click, %x%, %y%
	imgFound := 1
  }
 }
 Sleep 512
 while(imgFound1 = 0)
 {
  imageSearch, x1, y1, 0, 0, A_ScreenWidth, A_ScreenHeight, pod.png
  if(x)
  {
   Sleep 64
   Click, %x1%, %y1%
	imgFound1 := 1
  }
 }
return
}
