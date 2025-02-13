#SingleInstance, force ; Определяет, разрешено ли скрипту запускаться снова, если он уже выполняется.
#Persistent ; Постоянная работа скрипт

CheckClipboard:
    ClipWait ; Ожидает, пока буфер обмена не заполнится
    Clipboard := Trim(Clipboard) ; Убирает пробылы в начале и конце строки
    if (Clipboard != "") ; Проверяем, что буфер обмена не пуст
    {
        folderPath := "C:\Users\WiKi\Downloads\" Clipboard ; Путь для создания папки
        IfNotExist, %folderPath% ; Если папка не существует
        {
            FileCreateDir, %folderPath%    ; Создает папку
        }
    }
Return