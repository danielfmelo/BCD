#include "ServerSocket.h"
#include "SocketException.h"
#include <string>
#include <stdio.h>
#include <cstdlib>
#include <iostream>
#include <sstream>

using namespace std;

int main ( int argc, int argv[] )
{
  std::cout << "running....\n";

  try
    {
      // Create the socket
      ServerSocket server ( 30000 );

      while ( true )
	{
std::string data;
	  ServerSocket new_sock;
	  server.accept ( new_sock );

	  try
	    {
	    	bool tt=true;
	      while (tt==true)
		{
		  
		  new_sock >> data;
		  std::cout << data<<endl;
		  tt==false;
		  new_sock << data;

		}
	    }
	  catch ( SocketException& ) {}


 string dadoSeparado[5];

        int j = 0;

        for (int i = 0; i <= data.size(); i++) {

            if (data[i] != ';') {
                dadoSeparado[j] = dadoSeparado [j] + data[i];

            } else {
                j++;
            }
        }


std::cout << dadoSeparado[0] << " " << dadoSeparado[1] << " " << dadoSeparado[2] << endl;



	}
    }
  catch ( SocketException& e )
    {
      std::cout << "Exception was caught:" << e.description() << "\nExiting.\n";
    }

  return 0;
}
