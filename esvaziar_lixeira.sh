#!/bin/bash
function esvaziarLixeira {
	rm -rfv ~/.local/share/Trash/files/* 1> saida.txt
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
	dialog --textbox /home/gabriel/automacao-de-sistemas-com-shell-script/saida.txt 0 0
	clear
	dialog --infobox 'Concluído!' 0 0
	sleep $TEMPO_SONO
	sairPrograma
else
	sairPrograma
fi
