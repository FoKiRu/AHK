#SingleInstance,force
;FileAppend, 1`n, C:\Users\WIKI\Desktop\AHK\ahk-wiki\Test.txt
;FileDelete, C:\Users\WIKI\Desktop\AHK\ahk-wiki\Test.txt

/*
Var = ntcn

FileAppend,
(
Строка текста.
По умолчанию, возврат каретки (Enter) между этой строкой и предыдущей будет записан в файл.
    В начале этой строки находится табуляция; по умолчанию, эта табуляция также записывается в файл.
Ссылки на переменные наподобие %Var% по умолчанию раскрываются.
), C:\Users\WIKI\Desktop\AHK\ahk-wiki\Test.txt
*/

; Следующий пример демонстрирует, как можно автоматизировать загрузку на FTP, используя встроенную
; в операционную систему команду для работы с FTP.

FTPCommandFile = %A_Scriptdir%\FTPCommands.txt ; %A_Scriptdir% обозначает расположение скрипта
FTPLogFile = %A_Scriptdir%\FTPLog.txt
FileDelete %FTPCommandFile% ; На случай, если предыдущий запуск был прерван преждевременно.

FileAppend,
(
open host.domain.com
username
password
binary
cd htdocs
put %ПеременнаяСодержащаяИмяЦелевогоФайла%
delete SomeOtherFile.htm
rename OldFileName.htm NewFileName.htm
ls -l23
quit
), %FTPCommandFile%

RunWait %comspec% /c ftp.exe -s:"%%" >"%FTPLogFile%"
FileDelete %FTPCommandFile% ; Удалить по соображениям безопасности.
Run %FTPLogFile% ; Открыть лог-файл для просмотра.