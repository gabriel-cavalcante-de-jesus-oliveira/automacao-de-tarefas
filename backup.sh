#!/bin/bash
# Data de criação: 02/04/2022

# Realiza uma cópia de segurança de todos os diretórios e arquivos do usuário especificados ou qualquer que desejar (editando o script) para o diretório oculto
# ".backup" que ele cria em "/home/nome-do-usuario". Caso não consiga localizar, basta executar o script "compactar-backup.sh", que ele compacta e comprime todo o
# conteúdo do diretório ".backup", gerando o arquivo "backup.zip" e movendo-o para a sua área de trabalho

# Diretório oculto, para o usuário não remover por engano
function cria_diretorio_de_backup {
	cd ~
	if [ ! -e $BACKUP ]; then
		mkdir $BACKUP
	fi
}

function novo_backup {
	cd ~
	SEM_ATUALIZACAO=0

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

	## Paths resumidos ##
	BACKUP=~/.backup
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

	# Verifica se há atualização no arquivo oculto em questão, caso afirmativo, realiza uma cópia de segurança
	if [ -e $GITCONFIG ]; then
		if [ ! -e $BACKUP/.gitconfig ]; then
			cp -rf $GITCONFIG $BACKUP
		else
			DIFERENCA=$(diff $GITCONFIG $BACKUP/.gitconfig)
			if [ "$DIFERENCA" != "" ]; then
				rm -f $BACKUP/.gitconfig
				cp -rf $GITCONFIG $BACKUP
			else
				# Caso o valor da variável ao final das verificações de todos os itens seja 11 (total de itens analisados), significa
				# que não houve atualizações, neste caso, não poderá prosseguir para atualização do log
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/$GITCONFIG ]; then
			rm -f $BACKUP/$GITCONFIG
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	# Verifica recursivamente se há atualização no diretório em questão, caso afirmativo, realiza uma cópia de segurança
	QUANTIDADE_ITENS=$(ls $SSH | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/.ssh ]; then
			cp -rf $SSH $BACKUP
		else
			DIFERENCA=$(diff -r $SSH $BACKUP/.ssh)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/.ssh
				cp -rf $SSH $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/.ssh ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/.ssh | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/.ssh
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $DOCUMENTOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Documentos ]; then
			cp -rf $DOCUMENTOS $BACKUP
		else
			DIFERENCA=$(diff -r $DOCUMENTOS $BACKUP/Documentos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Documentos
				cp -rf $DOCUMENTOS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Documentos ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Documentos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Documentos
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $DOWNLOADS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Downloads ]; then
			cp -rf $DOWNLOADS $BACKUP
		else
			DIFERENCA=$(diff -r $DOWNLOADS $BACKUP/Downloads)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Downloads
				cp -rf $DOWNLOADS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Downloads ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Downloads | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Downloads
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $IMAGENS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Imagens ]; then
			cp -rf $IMAGENS $BACKUP
		else
			DIFERENCA=$(diff -r $IMAGENS $BACKUP/Imagens)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Imagens
				cp -rf $IMAGENS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Imagens ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Imagens | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Imagens
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $MODELOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Modelos ]; then
			cp -rf $MODELOS $BACKUP
		else
			DIFERENCA=$(diff -r $MODELOS $BACKUP/Modelos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Modelos
				cp -rf $MODELOS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Modelos ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Modelos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Modelos
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $MUSICA | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Música ]; then
			cp -rf $MUSICA $BACKUP
		else
			DIFERENCA=$(diff -r $MUSICA $BACKUP/Música)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Música
				cp -rf $MUSICA $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Música ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Música | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Música
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $NETBEANSPROJECTS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/NetBeansProjects ]; then
			cp -rf $NETBEANSPROJECTS $BACKUP
		else
			DIFERENCA=$(diff -r $NETBEANSPROJECTS $BACKUP/NetBeansProjects)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/NetBeansProjects
				cp -rf $NETBEANSPROJECTS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/NetBeansProjects ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/NetBeansProjects | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/NetBeansProjects
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $GERAIS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/gerais ]; then
			cp -rf $GERAIS $BACKUP
		else
			DIFERENCA=$(diff -r $GERAIS $BACKUP/gerais)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/gerais
				cp -rf $GERAIS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/gerais ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/gerais | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/gerais
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $VIDEOS | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Vídeos ]; then
			cp -rf $VIDEOS $BACKUP
		else
			DIFERENCA=$(diff -r $VIDEOS $BACKUP/Vídeos)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Vídeos
				cp -rf $VIDEOS $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Vídeos ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Vídeos | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Vídeos
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	QUANTIDADE_ITENS=$(ls $PUBLICO | wc -l)
	if [ $QUANTIDADE_ITENS -gt 0 ]; then
		if [ ! -e $BACKUP/Público ]; then
			cp -rf $PUBLICO $BACKUP
		else
			DIFERENCA=$(diff -r $PUBLICO $BACKUP/Público)
			if [ "$DIFERENCA" != "" ]; then
				rm -rf $BACKUP/Público
				cp -rf $PUBLICO $BACKUP
			else
				SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
			fi
		fi
	else
		if [ -e $BACKUP/Público ]; then
			QUANTIDADE_ITENS=$(ls $BACKUP/Público | wc -l)
			if [ $QUANTIDADE_ITENS -gt 0 ]; then
				rm -rf $BACKUP/Público
			fi
		fi
		SEM_ATUALIZACAO=$((++SEM_ATUALIZACAO))
	fi

	# Caso o valor da variável seja 11, significa que não houve atualização, então não prossegue para atualização do log
	if [ $SEM_ATUALIZACAO -eq 11 ]; then
		kdialog --title "$TITULO" --msgbox "Nenhuma atualização" &
		exit
	fi
}

function cria_diretorio_de_log {
	if [ ! -e .logs ]; then
		mkdir .logs
	fi
}

# Cónteudo do log: espaço total de armazenamento que ocupa o diretório de backup e data do último backup realizado
function log_de_backup {
	NOME_ARQUIVO="backup.txt"
	cd ~/Área\ de\ Trabalho
	cria_diretorio_de_log
	echo -n "Tamanho total: " 1> .logs/$NOME_ARQUIVO
	du -sh $BACKUP 1>> .logs/$NOME_ARQUIVO
	echo -n "Último backup: " 1>> .logs/$NOME_ARQUIVO
	date 1>> .logs/$NOME_ARQUIVO
}

TITULO="Backup"

kdialog --passivepopup "Copiando..." 3

cria_diretorio_de_backup
novo_backup
log_de_backup
kdialog --title "$TITULO" --msgbox "Finalizado" &

exit
