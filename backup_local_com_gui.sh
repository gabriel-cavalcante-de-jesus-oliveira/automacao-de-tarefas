#!/bin/bash
clear
declare -r TEMPO_SONO=2
if [ ! -e "/home/gabriel/.backup" ]
then
    mkdir "/home/gabriel/.backup"
fi
function removeBackupAntigo {
	dialog --infobox "Removendo backup antigo..." 0 0
    sleep $TEMPO_SONO
	cd ~/.backup
    rm -rf *
}
function realizaNovoBackup {
	dialog --infobox "Realizando novo backup..." 0 0
	sleep $TEMPO_SONO
	cd $HOME
	cp -rf Área\ de\ trabalho/quinto_semestre_de_computacao .backup
    cp -rf Documentos .backup
    cp -rf Downloads .backup
    cp -rf Imagens .backup
    cp -rf Modelos .backup
    cp -rf Música .backup
    cp -rf Público .backup
    cp -rf Vídeos .backup
	cp -rf temp .backup
	tree .backup 1> .log_de_arquivos_copiados.txt
	dialog --textbox .log_de_arquivos_copiados.txt 0 0
	rm -f .log_de_arquivos_copiados.txt
    sleep $TEMPO_SONO
}
function sairPrograma {
	dialog --infobox "Saíndo do programa" 0 0
	sleep $TEMPO_SONO
	clear
	exit
}
removeBackupAntigo
realizaNovoBackup
dialog --infobox "Concluído!" 0 0
sleep $TEMPO_SONO
sairPrograma
