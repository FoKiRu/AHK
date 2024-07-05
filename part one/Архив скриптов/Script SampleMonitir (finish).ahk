End::
 	reload
	Return

^d::
;Запуск скрипта
;SetTimer, SampleMonitor, 0
;Sleep 32

;-------------------------------//Начало скрипта SampleMonitor

SampleMonitor:
{
TestBadCaseTagFound := 0
TestAddFound := 0

while(TestBadCaseTagFound = 0)
{
imageSearch, x, y, 817, 380, 1067, 448, C:\Users\ROOT\Desktop\Script\Image\BadCaseTag.png
if (ErrorLevel = 2) {
} ; MsgBox Произвести поиск невозможно.	
else if (ErrorLevel = 1) {
} ; MsgBox Изображение не найдено на экране.
else {
	TestBadCaseTagFound = 1
}
}
if (TestAddFound := 1)
	sleep 512
	imageSearch, x, y, 822, 506, 931, 558, C:\Users\ROOT\Desktop\Script\Image\Add.png
if (ErrorLevel = 2) {
} ; MsgBox Произвести поиск невозможно.	
else if (ErrorLevel = 1) {
} ; MsgBox Изображение не найдено на экране.
else {
reload
}

SetTimer, SampleMonitor, off
return
}

;-------------------------------//Конец скрипта SampleMonitor
