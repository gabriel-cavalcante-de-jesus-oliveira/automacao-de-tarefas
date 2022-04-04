#!/bin/bash
function esvaziarLixeira {
	rm -rfv ~/.local/share/Trash/files/* 1> /home/gabriel/.log_de_arquivos_removidos.txt # arquivo oculto usado para registro
}
function sairPrograma {
	dialog --infobox 'Saíndo do programa...' 0 0
	sleep $TEMPO_SONO
	clear
	exit
}
declare -r TEMPO_SONO=1
dialog --title "Esvaziar lixeira" --yesno "Tem certeza que deseja remover todo o conteúdo da lixeira?" 0 0
if [ $? = 0 ]
then
	dialog --infobox 'Removendo todo o conteúdo da lixeira...' 0 0
	sleep $TEMPO_SONO
	esvaziarLixeira
	dialog --textbox /home/gabriel/.log_de_arquivos_removidos.txt 0 0
	rm /home/gabriel/.log_de_arquivos_removidos.txt # exclui o arquivo quando não for mais necessário
	clear
	dialog --infobox 'Concluído!' 0 0
	sleep $TEMPO_SONO
	sairPrograma
else
	sairPrograma
fi
