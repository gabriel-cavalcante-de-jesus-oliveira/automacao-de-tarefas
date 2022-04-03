#!/bin/bash
clear

declare -r TEMPO_SONO=1 # declaração de constante

if [ ! -e "/home/gabriel/.backup" ] # verifica se o diretório não existe
then
    mkdir "/home/gabriel/.backup"
fi

function removeBackupAntigo {
    echo "Removendo backup antigo..."
    sleep $TEMPO_SONO # a unidade de tempo é o segundo
    rm -rff "$/home/gabriel/.backup"
}

function realizaNovoBackup {
    echo "Realizando novo backup..."
	sleep $TEMPO_SONO
    cp -rvf "/home/gabriel/Área\ de\ trabalho/quinto_semestre_de_computacao/*" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Documentos" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Downloads" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Imagens" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Modelos" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Música" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Público" "/home/gabriel/.backup"
    cp -rvf "/home/gabriel/Vídeos" "/home/gabriel/.backup"
    sleep $TEMPO_SONO
}

removeBackupAntigo
realizaNovoBackup
clear
echo "concluido"

exit
