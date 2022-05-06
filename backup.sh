#!/bin/bash

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
	cp -r Área\ de\ Trabalho/Mainsoft .backup
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
	echo -ne "\n" 1>> arquivos-copiados.txt
	tree ~/.backup 1>> arquivos-copiados.txt
}

cria_diretorio &&
remove_backup_antigo &&
novo_backup &&
log_de_arquivos_copiados &&
(kdialog --title "Backup" --msgbox "Sucesso!" &) ||
(kdialog --title "Backup" --msgbox "Fracasso!" &)
exit
