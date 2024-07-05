#SingleInstance,force

later := DateAdd(A_Now, 31, "days")
MsgBox FormatTime(later)