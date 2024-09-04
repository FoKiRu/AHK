#SingleInstance, force

Numpad0::


If WinExist("DEAL_20240902_5ab3da86_66d5acadf1077 - Excel")
{
    WinActivate ; Активирует найденное окно.
    Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
    SendInput, ^{c}
        Sleep, 256
    Send, ^{PgDn}
        Sleep, 256
    Send, ^{f}
        Sleep, 256
    Send, ^{v}
        Sleep, 256
    Send, {Enter}
        Sleep, 256
    Send, {Esc}
        Sleep, 256
    Send, +{Space}
        Sleep, 256
    Send, ^{x}{Down}
        Sleep, 256
    Send, ^{PgUp}
        Sleep, 256
    Send, ^{v}
        Sleep, 256
    Send, {Down}
    Return
}
                        

End::reload
Home::pause
