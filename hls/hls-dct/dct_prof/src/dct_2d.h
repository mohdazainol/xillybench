#ifndef __DCT_2D_H_
#define __DCT_2D_H_

#define DW 10000
#define SFN 5000
#define DCT_SIZE 8
#define N (DW * DCT_SIZE * DCT_SIZE)

#define CONST_BITS  13
#define DESCALE(x,n)  (((x) + (1 << ((n)-1))) >> n)

typedef int dct_data_t;

void dct_1d(dct_data_t *src, dct_data_t *dst);
void half_dct_2d_0(dct_data_t *in_block, dct_data_t *out_block);
void half_dct_2d_1(dct_data_t *in_block, dct_data_t *out_block);

void half_dct_2d_test(dct_data_t *in_block, dct_data_t *out_block, int sfn);

#endif