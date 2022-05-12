#!/bin/bash

function verifica_se_tem_lixo {
	QUANTIDADE_ITENS=$(ls ~/.local/share/Trash/files | wc -l)
	if [ $QUANTIDADE_ITENS -eq 0 ]; then
		kdialog --title $TITULO --msgbox "Sem itens na lixeira" &
		exit
	fi
}

function log_de_arquivos_removidos {
	cd $LIXEIRA
	du -sh . 1> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	echo -en "\n" 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	date 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	echo -en "\n" 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
	tree . 1>> ~/Área\ de\ Trabalho/arquivos-removidos.txt
}

function remove_itens_lixeira {
	rm -rf $LIXEIRA/*
}

LIXEIRA=~/.local/share/Trash/files
TITULO="Esvaziar"

verifica_se_tem_lixo

log_de_arquivos_removidos &&
remove_itens_lixeira &&
(kdialog --title $TITULO --msgbox "Sucesso!" &) ||
(kdialog --title $TITULO --msgbox "Fracasso!" &)
exit
