NumpadAdd::
WinMinimize, A ; свернуть активное окно
ControlClick,, ahk_class GLFW30,, left,, D
Loop
{
Sleep 6500
ControlSend,, {w down}, ahk_class GLFW30
Sleep 90
ControlSend,, {w up}, ahk_class GLFW30
Sleep 6500
ControlSend,, {d down}, ahk_class GLFW30
Sleep 90
ControlSend,, {d up}, ahk_class GLFW30
Sleep 6500
ControlSend,, {s down}, ahk_class GLFW30
Sleep 160
ControlSend,, {s up}, ahk_class GLFW30
Sleep 6500
ControlSend,, {a down}, ahk_class GLFW30
Sleep 160
ControlSend,, {a up}, ahk_class GLFW30
}
Return







Sleep 150



ControlSend,, {w Down}, ahk_class GLFW30
ControlSend,, {Ctrl Down}, ahk_class GLFW30
ControlClick,, ahk_class GLFW30,, left,, D



;Numpad1::
{
WinMinimize, A ; свернуть активное окно
Return
} 

;End::
 	reload
	Return