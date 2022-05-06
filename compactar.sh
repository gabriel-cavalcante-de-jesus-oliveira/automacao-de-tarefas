#!/bin/bash

function compacta {
	cd ~/Área\ de\ Trabalho
	cp -r ~/.backup backup
	tar -czf backup.tar.gz backup
	rm -rf backup
}

compacta &&
(kdialog --title "Compactação" --msgbox "Sucesso!" &) ||
(kdialog --title "Compactação" --msgbox "Fracasso!" &)
exit
