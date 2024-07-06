#SingleInstance,force




EJSS: ; Executing JS in Skorozvon данный скрипт закрывает окно проекта
{
SetTitleMatchMode, 2  ; Настройка поиска окна по части заголовка
If WinExist("Google Chrome")  ; Убедиться, что Google Chrome открыт
{
    WinActivate  ; Активировать окно браузера
    Sleep, 500
    IfWinNotExist, DevTools - app.skorozvon.ru
        Send, {F12}  ; Открыть консоль разработчика (Ctrl+Shift+J в Chrome)
    else
        WinActivate
    Sleep, 1000
    oldClipboard := ClipboardAll  ; Сохранить текущее содержимое буфера обмена
    command := "var closeButton = document.querySelector('.do-close'); if (closeButton) {closeButton.click()} else { console.log('The element to close was not found.'); }"
    Clipboard := command  ; Копирование скрипта в буфер обмена
    Send, ^v  ; Вставить скрипт из буфера обмена в консоль разработчика
    Send, {Enter}
    Sleep, 500
    Clipboard := oldClipboard  ; Восстановить исходное содержимое буфера обмена
    Send, {F12}  ; Закрыть консоль разработчика
}
else
{
    MsgBox, Google Chrome не найден.
}
return
}