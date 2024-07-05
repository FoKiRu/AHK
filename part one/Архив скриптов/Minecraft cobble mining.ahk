Numpad1::
{
WinMinimize, A ; свернуть активное окно
Sleep 1500
ControlSend,, {t}, ahk_class GLFW30
Sleep 500
ControlSend,, /warp hub, ahk_class GLFW30
Sleep 150
ControlSend,, {enter}, ahk_class GLFW30
Sleep 3000
ControlSend,, {t}, ahk_class GLFW30
Sleep 500
ControlSend,, /warp home, ahk_class GLFW30
Sleep 150
ControlSend,, {enter}, ahk_class GLFW30
Sleep 5000
ControlSend,, {2}, ahk_class GLFW30
Sleep 500
ControlSend,, {w Down}, ahk_class GLFW30
ControlSend,, {Ctrl Down}, ahk_class GLFW30
ControlClick,, ahk_class GLFW30,, left,, D
Return
}

Numpad2::
{
ControlSend,, {w Down}, ahk_class LWJGL
ControlSend,, {Ctrl Down}, ahk_class LWJGL
ControlClick,, ahk_class LWJGL,, left,, D
Return
}

Numpad4::
{
WinMinimize, A ; свернуть активное окно
Return
} 





Numpad5::
{
ControlSend,, {esc}, ahk_class GLFW30
Return
}

Home::
Loop
{
	loop 10
	{
	
	}
} 
Return

End::
 	reload
	Return
