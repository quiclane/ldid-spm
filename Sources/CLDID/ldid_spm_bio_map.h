#pragma once
#include <openssl/bio.h>
#include <stddef.h>
static inline BIO* ldid_bio_from_map(const void* p,size_t n){return BIO_new_mem_buf(p,(int)n);}
