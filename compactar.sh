#!/bin/bash

function progresso {
	cd ~/Área\ de\ Trabalho
	if [ ! -d backup ]; then
		mkdir backup
	else
		rmdir backup
	fi
}

function compacta {
	cd ~
	tar -czf Área\ de\ Trabalho/backup.tar.gz .backup
}

TITULO="Compactar"

progresso &&
compacta &&
progresso &&
(kdialog --title $TITULO --msgbox "Sucesso!" &) ||
(kdialog --title $TITULO --msgbox "Fracasso!" &)
exit
