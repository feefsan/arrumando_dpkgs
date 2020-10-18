#!/bin/bash

#o objetivo desse shellzinho é ser um teste de funcionalidade de redirecionamentos (2>), grep e wc -l

#variaveis
MENES=()
QUANTIDADE_DE_MENES="0"
PONGO="bora"

#É hora de... PROCESSAR!
sudo dpkg --configure -a 2> saida.txt

echo "vamo ver qual é a desse mene maker ai"
echo "___________________"
echo "___________________"
echo " "

QUANTIDADE_DE_MENES=`grep erro saida.txt | wc -l`

echo "Então foram ${QUANTIDADE_DE_MENES} menes." 

while [[ ${PONGO} = "bora" ]] && [[ ${QUANTIDADE_DE_MENES} -ge 1 ]]
do
        echo " "
	echo "Bora resolver isso."
        for (( CONTAGEM=1; CONTAGEM<=QUANTIDADE_DE_MENES; CONTAGEM ++ ))
        do
                MENES[CONTAGEM]=`tail -${QUANTIDADE_DE_MENES} saida.txt | sed "${CONTAGEM}q;d"`
        done
        echo " "
        echo "Só para ter certeza que eu não vou fazer merda: esses são os mene";
        for (( CONTAGEM=1; CONTAGEM<=QUANTIDADE_DE_MENES; CONTAGEM ++ ))
        do
               echo ${MENES[CONTAGEM]}
	done
	echo " "
	echo "Quer continuar? digita 'bora' pra continuar.";
	read PONGO
	echo " "
        echo "Então beleza, vou dar um jeito pra tu."
        echo " "
        for (( CONTAGEM=1; CONTAGEM<=QUANTIDADE_DE_MENES; CONTAGEM ++ ))
        do
                sudo dpkg --force-all -P ${MENES[CONTAGEM]}
                sudo apt-get autoclean
                sudo apt-get autoremove
        done
        echo " "
        echo "Bora repetir? Digita 'bora' para arrumar outro mene ou 'não' para meter o pé." ; read PONGO
        if [[ ${PONGO} != "bora" ]] && [[ ${PONGO} != "não" ]];
        then
                while [[ ${PONGO} != "bora" ]] && [[ ${PONGO} != "não" ]];
                do
                        echo "É 'bora' ou 'não', meu cumpadi." ; read PONGO
                done
        fi
done

echo "lapras" > saida.txt
echo "___________________"
echo "___________________"

# Conclusão
echo " "
echo "Foi? Eu acho que foi. Então beleza."
echo "Até a próxima! Vou dormir agora, tchau."
