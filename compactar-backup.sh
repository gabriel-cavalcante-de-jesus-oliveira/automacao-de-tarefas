#!/bin/bash

function compacta {
	cd ~/Área\ de\ Trabalho
	zip -rq0 backup ~/.backup
}

function remove_arquivo_antigo {
	cd ~/Área\ de\ Trabalho
	rm backup.zip
}

function verifica_atualizacao {
	cd ~/Área\ de\ Trabalho
	if [ -e .logs/.copia-backup.txt ]; then
		DIFERENCA=$(diff .logs/backup.txt .logs/.copia-backup.txt)
		if [ "$DIFERENCA" != "" ]; then
			if [ -e backup.zip ]; then
				remove_arquivo_antigo
			fi
			kdialog --passivepopup "Compactando..." 3
			compacta
			cat .logs/backup.txt 1> .logs/.copia-backup.txt
		else
			kdialog --title $TITULO --msgbox "Nenhuma atualização" &
			exit
		fi
	else
		cp .logs/backup.txt .logs/.copia-backup.txt
		if [ -e backup.zip ]; then
			remove_arquivo_antigo
		fi
		kdialog --passivepopup "Compactando..." 3
		compacta
	fi
}

function cria_diretorio_de_logs {
	if [ ! -d .logs ]; then
		mkdir .logs
	fi
}

function log_de_compactacao {
	cd ~/Área\ de\ Trabalho
	cria_diretorio_de_logs
	NOME_ARQUIVO="compactacao.txt"
	echo -n "Última compactação: " 1> .logs/$NOME_ARQUIVO
	date 1>> .logs/$NOME_ARQUIVO
}

TITULO="Compactar"

verifica_atualizacao &&
log_de_compactacao &&
(kdialog --title $TITULO --msgbox "Operação realizada com sucesso!" &) ||
(kdialog --title $TITULO --error "Não foi possível realizar a operação!" &)

exit
