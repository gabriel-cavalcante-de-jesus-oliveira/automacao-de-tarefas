#!/bin/bash

function cria_diretorio_de_backup {
	cd ~
	if [ ! -e .backup ]; then
		mkdir .backup
	fi
}

function novo_backup {
	cd ~
	ATUALIZACAO=0

	## Coletânia ##

	# .gitconfig
	# .ssh
	# Documentos
	# Downloads
	# Imagens
	# Modelos
	# Música
	# NetBeansProjects
	# gerais
	# Vídeos
	# Público

	## Caminhos relativos ##
	GITCONFIG=~/.gitconfig
	SSH=~/.ssh
	DOCUMENTOS=~/Documentos
	DOWNLOADS=~/Downloads
	IMAGENS=~/Imagens
	MODELOS=~/Modelos
	MUSICA=~/Música
	NETBEANSPROJECTS=~/NetBeansProjects
	GERAIS=~/gerais
	VIDEOS=~/Vídeos
	PUBLICO=~/Público

	if [ -e $GITCONFIG ]; then
		if [ ! -e .backup/.gitconfig ]; then
			cp -rf $GITCONFIG .backup
		else
			DIFERENCA=$(diff $GITCONFIG .backup/.gitconfig)
			if [ "$DIFERENCA" != "" ]; then
				rm -f .backup/.gitconfig
				cp -rf $GITCONFIG .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/$GITCONFIG ]; then
			rm -f .backup/$GITCONFIG
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $SSH | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/.ssh ]; then
			cp -rf $SSH .backup
		else
			DIFERENCA=$(diff -r $SSH .backup/.ssh)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/.ssh
				cp -rf $SSH .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/.ssh ]; then
			QUANTIDADE_ITENS=$(ls .backup/.ssh | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/.ssh
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $DOCUMENTOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Documentos ]; then
			cp -rf $DOCUMENTOS .backup
		else
			DIFERENCA=$(diff -r $DOCUMENTOS .backup/Documentos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Documentos
				cp -rf $DOCUMENTOS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Documentos ]; then
			QUANTIDADE_ITENS=$(ls .backup/Documentos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Documentos
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $DOWNLOADS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Downloads ]; then
			cp -rf $DOWNLOADS .backup
		else
			DIFERENCA=$(diff -r $DOWNLOADS .backup/Downloads)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Downloads
				cp -rf $DOWNLOADS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Downloads ]; then
			QUANTIDADE_ITENS=$(ls .backup/Downloads | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Downloads
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $IMAGENS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Imagens ]; then
			cp -rf $IMAGENS .backup
		else
			DIFERENCA=$(diff -r $IMAGENS .backup/Imagens)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Imagens
				cp -rf $IMAGENS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Imagens ]; then
			QUANTIDADE_ITENS=$(ls .backup/Imagens | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Imagens
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $MODELOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Modelos ]; then
			cp -rf $MODELOS .backup
		else
			DIFERENCA=$(diff -r $MODELOS .backup/Modelos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Modelos
				cp -rf $MODELOS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Modelos ]; then
			QUANTIDADE_ITENS=$(ls .backup/Modelos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Modelos
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $MUSICA | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Música ]; then
			cp -rf $MUSICA .backup
		else
			DIFERENCA=$(diff -r $MUSICA .backup/Música)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Música
				cp -rf $MUSICA .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Música ]; then
			QUANTIDADE_ITENS=$(ls .backup/Música | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Música
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $NETBEANSPROJECTS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/NetBeansProjects ]; then
			cp -rf $NETBEANSPROJECTS .backup
		else
			DIFERENCA=$(diff -r $NETBEANSPROJECTS .backup/NetBeansProjects)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/NetBeansProjects
				cp -rf $NETBEANSPROJECTS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/NetBeansProjects ]; then
			QUANTIDADE_ITENS=$(ls .backup/NetBeansProjects | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/NetBeansProjects
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $GERAIS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/gerais ]; then
			cp -rf $GERAIS .backup
		else
			DIFERENCA=$(diff -r $GERAIS .backup/gerais)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/gerais
				cp -rf $GERAIS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/gerais ]; then
			QUANTIDADE_ITENS=$(ls .backup/gerais | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/gerais
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $VIDEOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Vídeos ]; then
			cp -rf $VIDEOS .backup
		else
			DIFERENCA=$(diff -r $VIDEOS .backup/Vídeos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Vídeos
				cp -rf $VIDEOS .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Vídeos ]; then
			QUANTIDADE_ITENS=$(ls .backup/Vídeos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Vídeos
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $PUBLICO | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e .backup/Público ]; then
			cp -rf $PUBLICO .backup
		else
			DIFERENCA=$(diff -r $PUBLICO .backup/Público)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Público
				cp -rf $PUBLICO .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		if [ -e .backup/Público ]; then
			QUANTIDADE_ITENS=$(ls .backup/Público | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf .backup/Público
			fi
		fi
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	if [ $ATUALIZACAO -eq 11 ]; then
		kdialog --title $TITULO --msgbox "Nenhuma atualização" &
		exit
	fi
}

function cria_diretorio_de_log {
	if [ ! -e .logs ]; then
		mkdir .logs
	fi
}

function log_de_backup {
	NOME_ARQUIVO="backup.txt"
	cd ~/Área\ de\ Trabalho
	cria_diretorio_de_log
	echo -n "Tamanho total: " 1> .logs/$NOME_ARQUIVO
	du -sh ~/.backup 1>> .logs/$NOME_ARQUIVO
	echo -n "Último backup: " 1>> .logs/$NOME_ARQUIVO
	date 1>> .logs/$NOME_ARQUIVO
}

TITULO="Backup"

kdialog --passivepopup "Copiando..." 3

cria_diretorio_de_backup
novo_backup
log_de_backup
kdialog --title $TITULO --msgbox "Finalizado" &

exit
