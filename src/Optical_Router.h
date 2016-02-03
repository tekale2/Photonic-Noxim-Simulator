#ifndef __OPTICALROUTER_H__
#define __OPTICALROUTER_H__
#include <iostream>
#include <map>
#include <string>
#include <sstream>
#include "DataStructs.h"
#define DIRS 10
using namespace std;

struct port_status
{
    bool L1_IN_USE; //lambda1 in use
    bool L2_IN_USE; //lambda2 in use
};
typedef struct port_status Status;

class Photonic_Router
{
private:
    Status reservation_status[DIRS];
    map<string,string> reservation_map;
public:
    Photonic_Router();//default constructor
    //returns 1 if the reservation was successful else returns false
   int reserve(int src_id, int dest_id, int dir_in, int dir_out, Lambda L);
   void dereserve(int src_id, int dest_id, Lambda L);
};


#endif
