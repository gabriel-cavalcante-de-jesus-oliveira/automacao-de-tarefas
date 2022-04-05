#!/bin/bash
# é necessário ter o pacote "dialog" instalado na máquina (rode "sudo apt install dialog -y")
# o "dialog" é utilizado para criação de caixas de diálogo do tipo TUI "Text User Interface"
function esvaziarLixeira {
	rm -rfv ~/.local/share/Trash/files/*
}
function logArquivosRemovidos { # cria log de arquivos excluídos
	tree ~/.local/share/Trash/files 1> ~/.log_de_arquivos_removidos.txt # arquivo oculto
}
function sairPrograma {
	# 0 0 são parâmetros para altura e largura, respectivamente, 0 0 para que o dialog ajuste dinamicamente para a gente
	dialog --infobox 'Saíndo do programa...' 0 0
	sleep $TEMPO_SONO
	clear
	exit
}
declare -r TEMPO_SONO=1 # a unidade de tempo é o segundo
#retorna código de retorno para a variável especial "$?"
dialog --title 'Esvaziar lixeira' --yesno 'Tem certeza que deseja remover todo o conteúdo da lixeira?' 0 0
if [ $? = 0 ] # 0 para "sim" e 1 para "não"
then
	dialog --infobox 'Removendo todo o conteúdo da lixeira...' 0 0
	sleep $TEMPO_SONO
	logArquivosRemovidos # deve ser invocada antes da função abaixo
	esvaziarLixeira
	dialog --textbox ~/.log_de_arquivos_removidos.txt 0 0 # exibe o log
	rm -f ~/.log_de_arquivos_removidos.txt # exclui o arquivo de log
	clear
	dialog --infobox 'Concluído!' 0 0
	sleep $TEMPO_SONO
	sairPrograma
else
	sairPrograma
fi
