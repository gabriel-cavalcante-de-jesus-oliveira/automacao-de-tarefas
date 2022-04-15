#!/bin/bash
if [ ! -e "/home/gabriel/.backup" ]; then
    mkdir "/home/gabriel/.backup"
fi
function removeBackupAntigo {
	echo "Removendo backup antigo..."
	sleep $TEMPO_SONO
	cd ~/.backup
    rm -rf *
}
function realizaNovoBackup {
	echo "Realizando novo backup..."
	sleep $TEMPO_SONO
	cd $HOME
	cp -rf Área\ de\ trabalho/quinto_semestre_de_computacao .backup
    cp -rf Documentos .backup
    cp -rf Downloads .backup
    cp -rf Imagens .backup
    cp -rf Modelos .backup
    cp -rf Música .backup
    cp -rf Público .backup
	cp -rf temp .backup
    cp -rf Vídeos .backup
}
function geraLogArquivosCopiados {
	echo "Gerando log de arquivos copiados..."
	sleep $TEMPO_SONO
	tree .backup 1> "$HOME/Área de trabalho/log-de-arquivos-copiados.txt"
}
function sairPrograma {
	echo "Saíndo do programa"
	sleep $TEMPO_SONO
	exit
}
declare -r TEMPO_SONO=2
removeBackupAntigo
realizaNovoBackup
geraLogArquivosCopiados
echo "Concluído!"
sleep $TEMPO_SONO
sairPrograma
