End::
 	reload
	Return

^d::
{
 BTa := 0
 imgFound := 0
 imgFound1 := 0
 imgFound2 := 0
 while(imgFound = 0)
 {
  imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\无忧售后纠纷.png
  if(x)
  {
   imgFound := 1
   BTa := 1
   MsgBox 无忧售后纠纷
  }
	else
	 BTa := 2
  
  
  if(BTa >= 2)
  {
  while(imgFound2 = 0)
  {
   imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\普通纠纷.png
   if(x)
  {
   imgFound2 := 1
   BTa := 3
   MsgBox 普通纠纷
  }
  else
  {
   BTa := 4
  }
  imgFound2 := 1
  }
  imgFound := 1
  }
  
  if(BTa >= 4)
  {
  while(imgFound3 = 0)
  {
   imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\无忧本地退货.png
    if(x)
  {
   imgFound3 := 1
   BTa := 5
   MsgBox 无忧本地退货
  }
	else
  {
   BTa := 6
  }
  }
  imgFound := 1
  imgFound2 := 1
  }
   MsgBox %BTa%
 }
return
}

Numpad1:: 
if(A_Hour < 6)
	state = ночь
else if(A_Hour < 10)
	state = утро
else if(A_Hour < 17)
	state = день
else
	state = вечер
	
MsgBox, Сейчас %state%`, %A_Hour% часов

