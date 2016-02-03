#include "Optical_Router.h"
using namespace std;
Photonic_Router::Photonic_Router()
{
    for(int i = 0;i<DIRS;i++)
        {
            reservation_status[i].L1_IN_USE = false;
            reservation_status[i].L2_IN_USE = false;
        }
}

int Photonic_Router::reserve(int src_id, int dest_id, int dir_in, int dir_out, Lambda L)
{
    //check if reservation can be made
    int out = dir_out + 5;
    int available = 0;
    string key;
    string value;
	map<string,string>:: iterator it;
    if (L == L1)
    {
        if(reservation_status[dir_in].L1_IN_USE == false &&reservation_status[out].L1_IN_USE== false )
        {
            available =1;
            reservation_status[dir_in].L1_IN_USE = true;
            reservation_status[out].L1_IN_USE= true;
            key = to_string(src_id) + " " + to_string(dest_id) + " " + to_string(0);
            value = to_string(dir_in) + " " + to_string(dir_out);
			it = reservation_map.find(key);
			if(it!= reservation_map.end())
				cout<<"reservation made already"<<endl;
			else
				reservation_map[key] = value;
        }
        else
            available = 0;
    }
     else if (L == L2)
    {
        if(reservation_status[dir_in].L2_IN_USE == false &&reservation_status[out].L2_IN_USE== false )
        {
            available =1;
            reservation_status[dir_in].L2_IN_USE = true;
            reservation_status[out].L2_IN_USE= true;
            key = to_string(src_id) + " " + to_string(dest_id) + " " + to_string(1);
            value = to_string(dir_in) + " " + to_string(dir_out);
			it = reservation_map.find(key);
			if(it!= reservation_map.end())
				cout<<"reservation made already"<<endl;
			else
				reservation_map[key] = value;
        }
        else
            available = 0;
    }
    return available;
}
void Photonic_Router::dereserve(int src_id, int dest_id, Lambda L)
{
    string key;
    int in_port;
    int out;
    string value;
    string temp;
    istringstream iss;
    map<string,string>:: iterator it;
    if(L == L1)
    {
        key = to_string(src_id) + " " + to_string(dest_id) + " " + to_string(0);
        it = reservation_map.find(key);
        if(it!= reservation_map.end())
        {
            value = it->second;
            reservation_map.erase(it);
            istringstream iss(value);
            iss>>temp;
            in_port = stoi(temp);
            iss>>temp;
            out = stoi(temp);
            reservation_status[in_port].L1_IN_USE = false;
            reservation_status[out].L1_IN_USE= false;
            //cout<<"Dereserving success"<<endl;
        }
        else
        {
            //cout<<"Error Occured, Dereservation failed"<<endl;
        }
    }
    else
    {
        key = to_string(src_id) + " " + to_string(dest_id) + " " + to_string(1);
        it = reservation_map.find(key);
        if(it!= reservation_map.end())
        {
            value = it->second;
            reservation_map.erase(it);
            istringstream iss(value);
            iss>>temp;
            in_port = stoi(temp);
            iss>>temp;
            out = stoi(temp);
            reservation_status[in_port].L2_IN_USE = false;
            reservation_status[out].L2_IN_USE= false;

        }
        else
        {
           // cout<<"Error Occured, Dereservation failed"<<endl;
        }
    }
}
