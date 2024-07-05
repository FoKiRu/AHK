#SingleInstance,force

Numpad1::
clipboard := ""
Sendinput,^{a}^{c}
Sleep 64
CurrentPrice := clipboard ; текущая цена
Sleep 128
VariableAmount = %CurrentPrice%
VariableAmount -= 0.5
Sendinput,%VariableAmount%{Enter} ;{Tab}
Return



End::
{
reload
Return
}

Home::pause