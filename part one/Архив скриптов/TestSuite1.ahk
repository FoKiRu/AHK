ie := ComObjCreate("InternetExplorer.Application")
ie.Visible := true
ie.Navigate("https://www.autohotkey.com/docs/v1/lib/ComObjCreate.htm")
while ie.readystate <> 4
 continue
msgbox, % ie.document.getElementsByTagName("pre")[0].innerText
document.getElementByTagName("pre")[0].innerText