#SingleInstance,force

;Функции могут возвращать результат
;Здесь MyVar будет присвоен результат выполнения функции
MyVar := SubStr("I'm scripting, awesome!", 16)

MsgBox, % MyVar

