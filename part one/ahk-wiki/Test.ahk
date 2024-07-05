#SingleInstance,force
if (ColorName = "" OR FindColor(ColorName, Region1) OR FindColor(ColorName, Region2))
	break ; Искать нечего, или мы нашли соответствие.