#include "ClientSocket.h"
#include "SocketException.h"
#include <iostream>
#include <sstream>
#include <string>
#include <stdio.h>
#include <cstdlib>

using namespace std;

int main ( int argc, int argv[] )
{
  
  int telOrigem;
  int telDestino;
  int opcao;;
  std::cout << "Qual seu número de telefone: (dois digitos)?" <<endl;
  std::cin >> telOrigem;
  std::cin.ignore();
  
  telOrigem=200+telOrigem;
  
  std::cout << "####Opções####"<<endl;
  std::cout << "1. Fazer Ligação;"<<endl;
  std::cout << "2. Desligar;"<<endl;
  std::cin >> opcao;
  std::cin.ignore();
                
  
   switch (opcao) {
            case 1:
                std::cout << "Digite o telefone do destino: "<<endl;
                  std::cin >> telDestino;
                  std::cin.ignore();
                
                break;
            case 2:

                std::cout << "Programa encerrado pelo cliente"<<endl;
                
                return 0;
                break;
          
   }
  try
    {

      ClientSocket client_socket ( "localhost", 30000 );

      std::string reply, ask;

stringstream ss;
ss << "0;"<<telOrigem<<";"<<telDestino;
ask= ss.str();

      try
          	{
          	  client_socket << ask;
          	  client_socket >> reply;
          	}
      catch ( SocketException& ) {}

      std::cout << "We received this response from the server:\n\"" << reply << "\"\n";;

    }
  catch ( SocketException& e )
    {
      std::cout << "Exception was caught:" << e.description() << "\n";
    }

  return 0;
}
