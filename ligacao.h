#ifndef LIGACAO_H
#define	LIGACAO_H
#include <string>
#include <vector>

using namespace std;

class Ligacao{
protected:
    //string titulo,genero,diretor,elenco,pais,chave;
    //unsigned int ano, votos, duracao, orcamento;
   // double avaliacao;
public:
Ligacao();
~Ligacao();


void atenderLigacao(int origem, int destino);
void fazerLigacao(int origem, int destino);
void encerrarLigacao(int origem, int destino);


};

#endif