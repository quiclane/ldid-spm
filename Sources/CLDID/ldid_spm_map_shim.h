#pragma once
#include <stdint.h>
#include <stddef.h>
#include <string>
#include <vector>
#include <fstream>

#if defined(LDID_NOTOOLS)
class Map{
    std::vector<uint8_t> buf_;
public:
    Map(const std::string& path,bool){
        std::ifstream f(path,std::ios::binary);
        if(!f)return;
        f.seekg(0,std::ios::end);
        auto n=f.tellg();
        if(n<=0)return;
        buf_.resize((size_t)n);
        f.seekg(0,std::ios::beg);
        f.read((char*)buf_.data(),(std::streamsize)buf_.size());
    }
    const uint8_t* data()const{return buf_.empty()?nullptr:buf_.data();}
    size_t size()const{return buf_.size();}
    const uint8_t* begin()const{return data();}
    const uint8_t* end()const{return data()+size();}
};
#endif
