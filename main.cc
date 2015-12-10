 #include <iostream>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <string>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <time.h>
 
 #include "ligacao.h"
 
using namespace std;
 int main(int argc, char** argv) {
     
        string dado; //string recebida pelo servidor enviada pelo client (0;011;112)
 
    /*
          FUNÇÃO SPLIT: separa os numeros entre os pontos e virgulas
         
         */
        int dadoSeparado[5];

        int j = 0;

        for (int i = 0; i <= dado.size(); i++) {

            if (dado[i] != ';') {
                dadoSeparado[j] = dadoSeparado [j] + dado[i];

            } else {
                j++;
            }
        }
        
        //verifica se o dado recebido é um pedido de ligação, para atender uma ligação ou encerrar
        
        switch (dadoSeparado[0]) {
            case 0:
                cout << "Ligação recebida de: " << dadoSeparado[1] <<" para: "<<dadoSeparado[2]<< endl;
                
                Ligacao::fazerLigacao(dadoSeparado[1],dadoSeparado[2]);
                
                
                break;
            case 1:

                cout << "Ligação atendida por: " << dadoSeparado[1] <<" de: "<<dadoSeparado[2]<< endl;
                
                Ligacao::atenderLigacao(dadoSeparado[1],dadoSeparado[2]);
                
                break;
            case 2:
            
                cout << "Ligação encerrada por: " << dadoSeparado[1] <<" com: "<<dadoSeparado[2]<< endl;
                
                Ligacao::encerrarLigacao(dadoSeparado[1],dadoSeparado[2]);

               break;


    return 0;