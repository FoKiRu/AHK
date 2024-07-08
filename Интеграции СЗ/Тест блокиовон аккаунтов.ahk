#SingleInstance,force

Numpad0::
Loop {
	Sleep 1024+512
imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\Менеджер.png
	if (ErrorLevel = 0) {
		imageSearch, x1, y1, x, y, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\Активен.png
		if (ErrorLevel = 0){
			x1+=120
			y1+=7
			Click %x1% %y1%
			ad()
		} else {
			SendInput {PgDn}
		}
	}
	else break
}
Return


ad(){
Click 1156, 601
Click 1156, 669
SendInput {Tab 4}{Enter}
Sleep 1000
}



;~ Менеджер
;~ Активен

;~ Numpad0::
;~ Loop 5 {
	;~ Sleep 1024+512
	;~ imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\Менеджер.png
	;~ if (ErrorLevel = 0) {
		;~ imageSearch, x1, y1, x, y, A_ScreenWidth, A_ScreenHeight, C:\Users\WIKI\Desktop\Интеграции СЗ\Image\Активен.png
		;~ if (ErrorLevel = 0){
			;~ x740 := x1-740
			;~ x725 := x1-725
			;~ y15 := y1+15
			MouseMove %x740%, %y1%
			;~ PixelSearch, x2, y2, x740, y1, x725, y15, 0xCCCCCC, 0, Fast RGB
			;~ if (ErrorLevel = 0) {
				;~ x1+=120
				;~ y1+=7
				;~ Click %x1% %y1%
				;~ ad()
				;~ x := x740
				;~ y := y15
			;~ }
		;~ } else {
			;~ SendInput {PgDn}
		;~ }
	;~ }
;~ }
;~ Return

;~ ad(){
;~ Click 1156, 601
;~ Click 1156, 669
;~ SendInput {Tab 4}{Enter}
;~ Sleep 5000
;~ }




End::
{
reload
Return
}

Home::pause