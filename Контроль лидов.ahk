#SingleInstance,force



date := "2024-08-26"

Numpad9::
SendInput, ^{f}%date%
/*
Sleep, 1024+512
imageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\WiKi\Pictures\AHK\0из0.png
if (ErrorLevel = 0) {
    If WinExist("[ЛиднегБюро] Состояние проектов | остатки тарифов - Google Таблицы - Google Chrome")
    {
        WinActivate ; Активирует найденное окно.
        Sleep, 500/2 ; Пауза для обеспечения времени на активацию окна.
        SendInput, 0{Down}
        MsgBox, Далле?
    } 
}
*/

Return

End::
{
reload
Return
}

Home::pause