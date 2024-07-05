#SingleInstance,force

Gui, Add, Text, , Пожалуйста, введите ваше имя:
Gui, Add, Button, vName, OK

Gui, Show

Name := vName

Numpad1::
MsgBox, %Name%




/*
Gui, Add, Checkbox, vOption1, Option 1
Gui, Add, Checkbox, vOption2, Option 2
Gui, Add, Checkbox, vOption3, Option 3
Gui, Font, norm
Gui, Show
Return

ButtonOK:
Gui, Submit
MyVar := ""
if (Option1)
    MyVar .= "Option 1 "
if (Option2)
    MyVar .= "Option 2 "
if (Option3)
    MyVar .= "Option 3 "
MsgBox Вы выбрали %MyVar%
ExitApp

