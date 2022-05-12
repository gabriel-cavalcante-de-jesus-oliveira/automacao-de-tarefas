#!/bin/bash

function progresso {
	cd ~/Área\ de\ Trabalho
	if [ ! -d backup ]; then
		mkdir backup
	else
		rmdir backup
	fi
}

function cria_diretorio {
	if [ ! -d ~/.backup ]; then
		mkdir ~/.backup
	fi
}

function remove_backup_antigo {
	rm -rf ~/.backup/*
}

function novo_backup {
	cd ~

	# diretórios/arquivos ocultos
	cp -r .gitconfig .backup
	cp -r .ssh .backup

	# diretórios/arquivos visíveis
	cp -r Documentos .backup
	cp -r Downloads .backup
	cp -r Imagens .backup
	cp -r Modelos .backup
	cp -r Música .backup
	cp -r NetBeansProjects .backup
	cp -r Público .backup
	cp -r temporario .backup
	cp -r Vídeos .backup
}

function log_de_arquivos_copiados {
	cd ~/Área\ de\ Trabalho
	du -sh ~/.backup 1> arquivos-copiados.txt
	echo -en "\n" 1>> arquivos-copiados.txt
	date 1>> arquivos-copiados.txt
	echo -en "\n" 1>> arquivos-copiados.txt
	tree ~/.backup 1>> arquivos-copiados.txt
}

TITULO="Copiar"

progresso &&
cria_diretorio &&
remove_backup_antigo &&
novo_backup &&
log_de_arquivos_copiados &&
progresso &&
(kdialog --title $TITULO --msgbox "Sucesso!" &) ||
(kdialog --title $TITULO --msgbox "Fracasso!" &)
exit
