#!/bin/bash

function verifica_se_tem_lixo {
	QUANTIDADE_ITENS=$(ls ~/.local/share/Trash/files | wc -l)
	if [ $QUANTIDADE_ITENS == 0 ]; then # vazio
		kdialog --title "Esvaziamento" --msgbox "Sem itens na lixeira" &
		exit
	fi
}

function log_de_arquivos_removidos {
	cd $LIXEIRA
	du -sh . 1> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	echo -en "\n" 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	tree . 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
}

function remove_itens_lixeira {
	rm -rf $LIXEIRA/*
}

LIXEIRA=~/.local/share/Trash/files

verifica_se_tem_lixo

log_de_arquivos_removidos &&
remove_itens_lixeira &&
(kdialog --title "Esvaziamento" --msgbox "Sucesso!" &) ||
(kdialog --title "Esvaziamento" --msgbox "Fracasso!" &)
exit
