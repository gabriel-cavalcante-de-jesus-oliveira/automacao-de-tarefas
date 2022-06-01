#!/bin/bash

function verifica_se_tem_lixo {
	QUANTIDADE_ITENS=$(ls ~/.local/share/Trash/files | wc -l)
	if [ $QUANTIDADE_ITENS -eq 0 ]; then
		kdialog --title $TITULO --msgbox "Sem itens na lixeira" &
		exit
	fi
}

function cria_diretorio_de_logs {
	if [ ! -d ~/Área\ de\ Trabalho/.logs ]; then
		mkdir ~/Área\ de\ Trabalho/.logs
	fi
}

function log_de_arquivos_removidos {
	cd $LIXEIRA
	cria_diretorio_de_logs
	NOME_ARQUIVO="esvaziamento.txt"
	echo -n "Tamanho total: " 1> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
	du -sh . 1>> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
	echo -n "Último esvaziamento: " 1>> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
	date 1>> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
	echo "Diretórios/arquivos excluídos: " 1>> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
	tree . 1>> ~/Área\ de\ Trabalho/.logs/$NOME_ARQUIVO
}

function remove_itens_lixeira {
	rm -rf $LIXEIRA/*
}

LIXEIRA=~/.local/share/Trash/files
TITULO="Esvaziar lixeira"

verifica_se_tem_lixo
log_de_arquivos_removidos
remove_itens_lixeira
kdialog --title $TITULO --msgbox "Finalizado" &

exit
