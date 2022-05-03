#!/bin/bash

if [ ! -d ~/.backup ]; then
	mkdir ~/.backup
fi

function remove_backup_antigo {
	rm -rf ~/.backup/*
}

function realiza_novo_backup {
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

function gera_log_de_arquivos_copiados {
	cd ~/Área\ de\ Trabalho
	du -sh ~/.backup 1> log-de-arquivos-copiados.txt
	echo "" 1>> log-de-arquivos-copiados.txt
	tree ~/.backup 1>> log-de-arquivos-copiados.txt
}

remove_backup_antigo &&
realiza_novo_backup &&
gera_log_de_arquivos_copiados &&
(kdialog --title "Backup" --msgbox "Sucesso!" &) ||
(kdialog --title "Backup" --msgbox "Fracasso!" &)
exit
