#include "dct.h"

void dct_1d(dct_data_t src[DCT_SIZE], dct_data_t dst[DCT_SIZE])
{
   unsigned int k, n;
   int tmp;
   const dct_data_t dct_coeff_table[DCT_SIZE][DCT_SIZE] = {
#include "dct_coeff_table.txt"
   };

DCT_Outer_Loop:
   for (k = 0; k < DCT_SIZE; k++) {
#pragma HLS PIPELINE
DCT_Inner_Loop:
      for(n = 0, tmp = 0; n < DCT_SIZE; n++) {
         int coeff = (int)dct_coeff_table[k][n];
         tmp += src[n] * coeff;
      }
      dst[k] = DESCALE(tmp, CONST_BITS);
   }
}

void dct_2d(dct_data_t in_block[DCT_SIZE][DCT_SIZE],
      dct_data_t out_block[DCT_SIZE][DCT_SIZE])
{
#pragma HLS ARRAY_PARTITION variable=in_block complete dim=2

	unsigned i;
//	unsigned k;
//	for (k = 0; k < /*DW*/SFN; k++) {
	// DCT rows
Row_DCT_Loop:
	for(i = 0; i < DCT_SIZE; i++) {
		dct_1d(in_block[i], out_block[i]);
	}
//	}
}

void dct(dct_data_t in_block[DCT_SIZE][DCT_SIZE],
      dct_data_t out_block[DCT_SIZE][DCT_SIZE])
{
//#pragma HLS INLINE
   dct_data_t row_outbuf[DCT_SIZE][DCT_SIZE];
   dct_data_t col_outbuf[DCT_SIZE][DCT_SIZE];
   dct_data_t col_inbuf[DCT_SIZE][DCT_SIZE];
#pragma HLS ARRAY_PARTITION variable=col_inbuf complete dim=2

//#pragma HLS ARRAY_PARTITION variable=col_inbuf complete dim=2
//   unsigned i, j;

   // DCT rows
   /*
Row_DCT_Loop:
   for(i = 0; i < DCT_SIZE; i++) {
      dct_1d_opt(in_block[i], row_outbuf[i]);
   }
   */
   dct_2d(in_block, row_outbuf);
   /*
   // Transpose data in order to re-use 1D DCT code
Xpose_Row_Outer_Loop:
   for (j = 0; j < DCT_SIZE; j++)
Xpose_Row_Inner_Loop:
      for(i = 0; i < DCT_SIZE; i++)
#pragma HLS PIPELINE
    	  col_inbuf[j][i] = row_outbuf[i][j];
		  */
   transpose(row_outbuf, col_inbuf);

   // DCT columns
   /*
Col_DCT_Loop:
   for (i = 0; i < DCT_SIZE; i++) {
      dct_1d_opt(col_inbuf[i], col_outbuf[i]);
   }
   */
   dct_2d(col_inbuf, col_outbuf);
   /*
   // Transpose data back into natural order
Xpose_Col_Outer_Loop:
   for (j = 0; j < DCT_SIZE; j++)
Xpose_Col_Inner_Loop:
      for(i = 0; i < DCT_SIZE; i++)
#pragma HLS PIPELINE
    	  out_block[j][i] = col_outbuf[i][j];
		  */
   transpose(col_outbuf, out_block);
}

void transpose(dct_data_t in_block[DCT_SIZE][DCT_SIZE], 
      dct_data_t out_block[DCT_SIZE][DCT_SIZE])
{
	int i, j;
	// Transpose data back into natural order
Xpose_Col_Outer_Loop:
	for (j = 0; j < DCT_SIZE; j++)
		Xpose_Col_Inner_Loop:
			for(i = 0; i < DCT_SIZE; i++)
#pragma HLS PIPELINE
				out_block[j][i] = in_block[i][j];
}

void read_data(short input[N], short buf[DCT_SIZE][DCT_SIZE])
{
   int r, c;

RD_Loop_Row:
   for (r = 0; r < DCT_SIZE; r++) {
RD_Loop_Col:
      for (c = 0; c < DCT_SIZE; c++)
#pragma HLS PIPELINE
    	  buf[r][c] = input[r * DCT_SIZE + c];
   }
}

void write_data(short buf[DCT_SIZE][DCT_SIZE], short output[N])
{
   int r, c;

WR_Loop_Row:
   for (r = 0; r < DCT_SIZE; r++) {
WR_Loop_Col:
      for (c = 0; c < DCT_SIZE; c++)
#pragma HLS PIPELINE
    	  output[r * DCT_SIZE + c] = buf[r][c];
   }
}

void dct_test(short input[N], short output[N])
{
   short buf_2d_in[DCT_SIZE][DCT_SIZE];
#pragma HLS ARRAY_PARTITION variable=buf_2d_in complete dim=2
   short buf_2d_out[DCT_SIZE][DCT_SIZE];

   // Read input data. Fill the internal buffer.
   read_data(input, buf_2d_in);
   
//   dct_2d(buf_2d_in, buf_2d_out);
   dct(buf_2d_in, buf_2d_out);

   // Write out the results.
   write_data(buf_2d_out, output);
}
