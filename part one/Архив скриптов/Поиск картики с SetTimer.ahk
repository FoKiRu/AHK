End::
 	reload
	Return

^d::
imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\无忧售后纠纷.png ; A_ScreenWidth, A_ScreenHeight 
if (ErrorLevel = 2) {
    MsgBox Произвести поиск невозможно.
} else if (ErrorLevel = 1) {
    imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ROOT\Desktop\AHK\Image\普通纠纷.png ; A_ScreenWidth, A_ScreenHeight 
if (ErrorLevel = 2) {
    MsgBox Произвести поиск невозможно.
} else if (ErrorLevel = 1) {
    MsgBox Изображение не найдено на экране.
} else if (ErrorLevel = 0) {
	BusinessTypeCount = 2
}
} else if (ErrorLevel = 0) {
	BusinessTypeCount = 1
}

SetTimer, BusinessTypeMonitor, 0

return

BusinessTypeMonitor:
if (BusinessTypeCount = 1) {
	msgbox Изображение найдено в координатах x=%x%, y=%y% 无忧售后纠纷
} else if (BusinessTypeCount = 2) {
	msgbox Изображение найдено в координатах x=%x%, y=%y% 普通纠纷
} else if (BusinessTypeCount = 4) {
	msgbox null
} else if (BusinessTypeCount > 2) {
	msgbox null
}


BusinessTypeCount := 0
SetTimer, BusinessTypeMonitor, off
return

; BusinessType = 1 无忧售后纠纷
; BusinessType = 2 普通纠纷
; BusinessTypeCount
; BusinessTypeMonitor

