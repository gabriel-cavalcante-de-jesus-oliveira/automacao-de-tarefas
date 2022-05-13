#!/bin/bash

function compacta {
	cd ~
	tar -czf Área\ de\ Trabalho/backup.tar.gz .backup
}

TITULO="Compactar"

kdialog --passivepopup "Compactando..." 3

compacta &&
(kdialog --title $TITULO --msgbox "Operação realizada com sucesso!" &) ||
(kdialog --title $TITULO --error "Não foi possível realizar a operação!" &)
exit
