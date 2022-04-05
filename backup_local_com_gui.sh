#!/bin/bash
clear
declare -r TEMPO_SONO=2
if [ ! -e "/home/gabriel/.backup" ]
then
    mkdir "/home/gabriel/.backup"
fi
function removeBackupAntigo {
	dialog --infobox 'Removendo backup antigo...' 0 0
    sleep $TEMPO_SONO
    rm -rf "$/home/gabriel/.backup"
}
function realizaNovoBackup {
	dialog --infobox 'Realizando novo backup...' 0 0
	sleep $TEMPO_SONO
	cp -rf "/home/gabriel/Área de trabalho/quinto_semestre_de_computacao" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Documentos" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Downloads" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Imagens" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Modelos" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Música" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Público" "/home/gabriel/.backup"
    cp -rf "/home/gabriel/Vídeos" "/home/gabriel/.backup"
	cp -rf "/home/gabriel/temp" "/home/gabriel/.backup"
	tree ~/.backup 1> ~/.log_de_arquivos_copiados.txt
	dialog --textbox ~/.log_de_arquivos_copiados.txt 0 0
	rm -f ~/.log_de_arquivos_copiados.txt
    sleep $TEMPO_SONO
}
function sairPrograma {
	dialog --infobox 'Saíndo do programa' 0 0
	sleep $TEMPO_SONO
	clear
	exit
}
removeBackupAntigo
realizaNovoBackup
dialog --infobox 'Concluído!' 0 0
sleep $TEMPO_SONO
sairPrograma
exit
