#SingleInstance,force

MyVar = 0

;Здесь MsgBox и Send будут выполнены только если MyVar равна 5
if(MyVar += 5, MyVar == 5)
{
	MsgBox, MyVar равна 5!
}

