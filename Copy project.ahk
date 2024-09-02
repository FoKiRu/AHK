#SingleInstance, force

Numpad0::


If WinExist("Calls total 26.08.2024—27.08.2024 (1) - Excel")
{
    WinActivate ; Активирует найденное окно.
    Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
    SendInput, ^{c}
    Sleep, 128
    SendInput,{down}
    Sleep, 128
    SendInput,!{Tab}
    Sleep, 512
    Click 302, 344
    Sleep, 512
    SendInput, {Tab 5}{Space}{Tab}^{v}
    Sleep, 512
    Click 173, 642
    SendInput,{Tab 2}{Space}
    Return
}
                        

End::reload
Home::pause
