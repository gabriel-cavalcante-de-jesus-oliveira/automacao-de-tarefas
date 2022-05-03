#!/bin/bash

cd ~/.local/share/Trash/files &&
du -sh . 1> ~/Área\ de\ Trabalho/log-de-arquivos-removidos.txt &&
echo "" 1>> ~/Área\ de\ Trabalho/log-de-arquivos-removidos.txt &&
tree . 1>> ~/Área\ de\ Trabalho/log-de-arquivos-removidos.txt &&
rm -rf ~/.local/share/Trash/files/* &&
(kdialog --title "Esvaziamento" --msgbox "Sucesso!" &) ||
(kdialog --title "Esvaziamento" --msgbox "Fracasso!" &)
exit
