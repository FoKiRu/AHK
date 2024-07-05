#SingleInstance,force



Loop
{
    FileReadLine, line, Test.txt, %A_Index%
    if ErrorLevel
        break
    MsgBox, 4, , Строка №%A_Index%: "%line%".  Продолжить?
    IfMsgBox, No
        return
}
MsgBox, Достигнут конец файла или возникла проблема чтения.
Return