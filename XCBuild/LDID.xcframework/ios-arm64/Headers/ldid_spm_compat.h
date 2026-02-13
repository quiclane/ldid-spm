#pragma once
#include <stdint.h>
#include <stddef.h>
#include <string>
#include <vector>
#include <fstream>

#ifndef LDID_VERSION
#define LDID_VERSION "1.0.0"
#endif

#if defined(LDID_NOTOOLS)
class Map{
    std::vector<uint8_t> b_;
public:
    Map(const std::string& path,bool){
        std::ifstream f(path,std::ios::binary);
        if(!f)return;
        f.seekg(0,std::ios::end);
        auto n=f.tellg();
        if(n<=0)return;
        b_.resize((size_t)n);
        f.seekg(0,std::ios::beg);
        f.read((char*)b_.data(),(std::streamsize)b_.size());
    }
    const uint8_t* data()const{return b_.empty()?nullptr:b_.data();}
    size_t size()const{return b_.size();}
    const uint8_t* begin()const{return data();}
    const uint8_t* end()const{return data()+size();}
};
#endif
