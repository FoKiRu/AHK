; Первая заглавная буква по CTRL + A
^a:: 
	; Получение выделенного текста
	ClipSaved := ClipboardAll
	clipboard := ""
	Send, ^{sc02E}  ; ctrl+c
	ClipWait, 0.2
	selected := clipboard
	Clipboard := ClipSaved
	
	; Преобразование регистра
	text := ""
	if InStr(selected, " ") {
		Loop, parse, selected, " "
		{
			if(A_Index = 1) {
				row := A_LoopField
				StringUpper, row, row, T
				text .= row . " "
			} else {
				tt := A_LoopField
				StringLower, tt, tt
				text .=с tt  . " "
			}
		}
		text := trim(text)
	} else {
		StringUpper, text, selected, T
	}
		
	; Вывод текста через буфер (так быстрее и проще отменить)
	clipboard_tmp := ClipboardAll
	Clipboard := text
	sleep 50
	Send, ^{sc02F}  ; ctrl+v
	sleep 50
	exit