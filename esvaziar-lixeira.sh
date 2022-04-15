#!/bin/bash
LIXEIRA="$HOME/.local/share/Trash/files/"
cd $LIXEIRA
tree . 1> "$HOME/Área de trabalho/log-de-arquivos-removidos.txt"
rm -rf *
exit
