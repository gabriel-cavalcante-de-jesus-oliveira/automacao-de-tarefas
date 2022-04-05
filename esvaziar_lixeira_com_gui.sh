#!/bin/bash
# é necessário ter o pacote "dialog" instalado na máquina (rode "sudo apt install dialog -y")
# é necessário ter o pacote "tree" instalado na máquina (rode "sudo apt install tree -y")
# o "dialog" é utilizado para criação de caixas de diálogo do tipo TUI "Text User Interface"
function verificaPacotes { # verifica se os pacotes "dialog" e "tree" estão instalados
	TEM_DIALOG=1
	TEM_TREE=1
	#verifica se o pacote "dialog" está instalado
	dialog --version 1> /dev/null 2> /dev/null
	if [ $? = 127 ]; then
		echo "Pacote \"dialog\" necessário!"
		TEM_DIALOG=0 # false
	fi
	# verifica se o pacote "tree" está instalado
	tree --version 1> /dev/null 2> /dev/null
	if [ $? = 127 ]; then
		echo "Pacote \"tree\" necessário!"
		TEM_TREE=0 # false
	fi
	if [ $TEM_DIALOG -eq 0 ]; then
		exit
	fi
	if [ $TEM_TREE -eq 0; then
		exit
	fi
}
function esvaziarLixeira {
	# não é necessário acessar o caminho da lixeira novamente, pois a função abaixo já o faz
	rm -rf *
}
function logArquivosRemovidos { # cria log de arquivos excluídos
	cd $CAMINHO_LIXEIRA
	tree . 1> ~/.log_de_arquivos_removidos.txt # arquivo oculto
}
function sairPrograma {
	# 0 0 são parâmetros para altura e largura, respectivamente, 0 0 para que o dialog ajuste dinamicamente para a gente
	dialog --infobox 'Saíndo do programa...' 0 0
	sleep $TEMPO_SONO
	clear
	exit
}
declare -r TEMPO_SONO=1
declare -r CAMINHO_LIXEIRA="/home/gabriel/.local/share/Trash/files" # tem que ser o caminho absoluto
declare -r CAMINHO_HOME="/home/gabriel"
verificaPacotes
#retorna código de retorno para a variável especial "$?"
dialog --title 'Esvaziar lixeira' --yesno 'Tem certeza que deseja remover todo o conteúdo da lixeira?' 0 0
if [ $? = 0 ] # 0 para "sim" e 1 para "não"
then
	dialog --infobox 'Removendo todo o conteúdo da lixeira...' 0 0
	sleep $TEMPO_SONO # a unidade de tempo é o segundo
	logArquivosRemovidos # deve ser invocada antes da função abaixo
	esvaziarLixeira
	cd $CAMINHO_HOME
	dialog --textbox .log_de_arquivos_removidos.txt 0 0 # exibe o log
	rm -f .log_de_arquivos_removidos.txt # exclui o arquivo de log
	clear
	dialog --infobox 'Concluído!' 0 0
	sleep $TEMPO_SONO
	sairPrograma
else
	sairPrograma
fi
