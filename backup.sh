#!/bin/bash

function cria_diretorio_de_backup {
	if [ ! -d ~/.backup ]; then
		mkdir ~/.backup
	fi
}

function novo_backup {
	cd ~
	ATUALIZACAO=0

	# diretórios/arquivos ocultos
	if [ -e .gitconfig ]; then
		if [ ! -e .backup/.gitconfig ]; then
			cp -rf .gitconfig .backup
		else
			DIFERENCA=$(diff .gitconfig .backup/.gitconfig)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/.gitconfig
				cp -rf .gitconfig .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	fi

	QUANTIDADE_ITENS=$(ls .ssh | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d backup/.ssh ]; then
			cp -rf .ssh .backup
		else
			DIFERENCA=$(diff -r .ssh .backup/.ssh)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/.ssh
				cp -rf .ssh .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	# diretórios/arquivos visíveis
	QUANTIDADE_ITENS=$(ls Documentos | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Documentos ]; then
			cp -rf Documentos .backup
		else
			DIFERENCA=$(diff -r Documentos .backup/Documentos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Documentos
				cp -rf Documentos .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Downloads | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Downloads ]; then
			cp -rf Downloads .backup
		else
			DIFERENCA=$(diff -r Downloads .backup/Downloads)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Downloads
				cp -rf Downloads .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Imagens | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Imagens ]; then
			cp -rf Imagens .backup
		else
			DIFERENCA=$(diff -r Imagens .backup/Imagens)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Imagens
				cp -rf Imagens .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Modelos | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Modelos ]; then
			cp -rf Modelos .backup
		else
			DIFERENCA=$(diff -r Modelos .backup/Modelos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Modelos
				cp -rf Modelos .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Música | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Música ]; then
			cp -rf Música .backup
		else
			DIFERENCA=$(diff -r Música .backup/Música)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Música
				cp -rf Música .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls NetBeansProjects | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/NetBeans/Projects ]; then
			cp -rf NetBeansProjects .backup
		else
			DIFERENCA=$(diff -r NetBeansProjects .backup/NetBeansProjects)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/NetBeansProjects
				cp -rf NetBeansProjects .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls gerais | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/gerais ]; then
			cp -rf gerais .backup
		else
			DIFERENCA=$(diff -r gerais .backup/gerais)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/gerais
				cp -rf gerais .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Vídeos | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Vídeos ]; then
			cp -rf Vídeos .backup
		else
			DIFERENCA=$(diff -r Vídeos .backup/Vídeos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Vídeos
				cp -rf Vídeos .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls Público | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -d .backup/Público ]; then
			cp -rf Público .backup
		else
			DIFERENCA=$(diff -r Público .backup/Público)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf .backup/Público
				cp -rf Público .backup
			else
				ATUALIZACAO=$((++ATUALIZACAO))
			fi
		fi
	else
		ATUALIZACAO=$((++ATUALIZACAO))
	fi

	if [ $ATUALIZACAO -eq 9 ]; then
		kdialog --title $TITULO --msgbox "Nenhuma atualização" &
		exit
	fi
}

function cria_diretorio_de_log {
	if [ ! -d .logs ]; then
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

cria_diretorio_de_backup &&
novo_backup &&
log_de_backup &&
(kdialog --title $TITULO --msgbox "Operação realizada com sucesso!" &) ||
(kdialog --title $TITULO --error "Não foi possível realizar a operação!" &)
exit
