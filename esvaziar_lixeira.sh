#!/bin/bash
function esvaziarLixeira {
	rm -rfv ~/.local/share/Trash/files/*
}
clear
echo 'Tem certeza que deseja remover todo o conteúdo da lixeira?'
read -p 'S/N: ' OPCAO
clear
if [ "$OPCAO" = 'S' -o "$OPCAO" = 's' ]
then
	echo 'Removendo todo o conteúdo da lixeira...'
	sleep 1
	esvaziarLixeira
	clear
	echo 'Concluído'
else
	echo 'Saíndo do programa...'
	sleep 1
fi
