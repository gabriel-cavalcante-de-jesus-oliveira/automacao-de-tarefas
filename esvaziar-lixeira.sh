#!/bin/bash
# o "dialog" é utilizado para criação de caixas de diálogo do tipo TUI "Text User Interface"
function verificaPacotes {
	TEM_DIALOG=1 #true
	TEM_TREE=1
	#verifica se o pacote "dialog" está instalado
	dialog --version 1> /dev/null 2> /dev/null
	if [ $? = 127 ]; then # "$?" armazena o código de retorno do último comando utilizado
		echo "Pacote \"dialog\" necessário!"
		TEM_DIALOG=0 # false
	fi
	# verifica se o pacote "tree" está instalado
	tree --version 1> /dev/null 2> /dev/null
	if [ $? = 127 ]; then
		echo "Pacote \"tree\" necessário!"
		TEM_TREE=0
	fi
	# sai do programa
	if [ $TEM_DIALOG -eq 0 -o $TEM_TREE -eq 0 ]; then
		exit
	fi
}
function esvaziarLixeira {
	# não é necessário acessar o diretório da lixeira, pois a função abaixo já o fez
	rm -rf *
}
function logArquivosRemovidos { # cria log de arquivos removidos
	cd $CAMINHO_LIXEIRA
	tree . 1> ~/.log_de_arquivos_removidos.txt # arquivo oculto
}
function sairPrograma {
	# altura e largura, respectivamente, se for 0 0, o "dialog" ajusta dinamicamente
	dialog --infobox "Saíndo do programa..." 0 0
	sleep $TEMPO_SONO # em segundos
	clear
	exit
}
declare -r TEMPO_SONO=1
declare -r CAMINHO_LIXEIRA="$HOME/.local/share/Trash/files"
verificaPacotes
dialog --title "Esvaziar lixeira" --yesno "Tem certeza que deseja remover o conteúdo da lixeira?" 0 0
if [ $? = 0 ]; then # 0 para "sim" e 1 para "não"
	dialog --infobox "Removendo o conteúdo da lixeira..." 0 0
	sleep $TEMPO_SONO
	logArquivosRemovidos # deve ser invocada antes da função abaixo
	esvaziarLixeira
	cd $HOME
	dialog --textbox .log_de_arquivos_removidos.txt 0 0 # exibe o log
	rm -f .log_de_arquivos_removidos.txt # exclui o arquivo de log
	clear
	dialog --infobox "Concluído!" 0 0
	sleep $TEMPO_SONO
	sairPrograma
else
	sairPrograma
fi
