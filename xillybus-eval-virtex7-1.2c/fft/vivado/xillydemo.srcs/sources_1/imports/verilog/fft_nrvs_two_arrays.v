// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.1
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module fft_nrvs_two_arrays (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        n,
        a_real_address0,
        a_real_ce0,
        a_real_we0,
        a_real_d0,
        a_real_q0,
        a_imag_address0,
        a_imag_ce0,
        a_imag_we0,
        a_imag_d0,
        a_imag_q0,
        y_real_address0,
        y_real_ce0,
        y_real_we0,
        y_real_d0,
        y_real_q0,
        y_imag_address0,
        y_imag_ce0,
        y_imag_we0,
        y_imag_d0,
        y_imag_q0,
        direction
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 6'b000000;
parameter    ap_ST_st2_fsm_1 = 6'b1;
parameter    ap_ST_st3_fsm_2 = 6'b10;
parameter    ap_ST_st4_fsm_3 = 6'b11;
parameter    ap_ST_st5_fsm_4 = 6'b100;
parameter    ap_ST_st6_fsm_5 = 6'b101;
parameter    ap_ST_st7_fsm_6 = 6'b110;
parameter    ap_ST_st8_fsm_7 = 6'b111;
parameter    ap_ST_st9_fsm_8 = 6'b1000;
parameter    ap_ST_st10_fsm_9 = 6'b1001;
parameter    ap_ST_st11_fsm_10 = 6'b1010;
parameter    ap_ST_st12_fsm_11 = 6'b1011;
parameter    ap_ST_st13_fsm_12 = 6'b1100;
parameter    ap_ST_st14_fsm_13 = 6'b1101;
parameter    ap_ST_st15_fsm_14 = 6'b1110;
parameter    ap_ST_st16_fsm_15 = 6'b1111;
parameter    ap_ST_st17_fsm_16 = 6'b10000;
parameter    ap_ST_st18_fsm_17 = 6'b10001;
parameter    ap_ST_st19_fsm_18 = 6'b10010;
parameter    ap_ST_st20_fsm_19 = 6'b10011;
parameter    ap_ST_st21_fsm_20 = 6'b10100;
parameter    ap_ST_st22_fsm_21 = 6'b10101;
parameter    ap_ST_st23_fsm_22 = 6'b10110;
parameter    ap_ST_st24_fsm_23 = 6'b10111;
parameter    ap_ST_st25_fsm_24 = 6'b11000;
parameter    ap_ST_st26_fsm_25 = 6'b11001;
parameter    ap_ST_st27_fsm_26 = 6'b11010;
parameter    ap_ST_st28_fsm_27 = 6'b11011;
parameter    ap_ST_st29_fsm_28 = 6'b11100;
parameter    ap_ST_st30_fsm_29 = 6'b11101;
parameter    ap_ST_st31_fsm_30 = 6'b11110;
parameter    ap_ST_st32_fsm_31 = 6'b11111;
parameter    ap_ST_st33_fsm_32 = 6'b100000;
parameter    ap_ST_st34_fsm_33 = 6'b100001;
parameter    ap_ST_st35_fsm_34 = 6'b100010;
parameter    ap_ST_st36_fsm_35 = 6'b100011;
parameter    ap_ST_st37_fsm_36 = 6'b100100;
parameter    ap_ST_st38_fsm_37 = 6'b100101;
parameter    ap_ST_st39_fsm_38 = 6'b100110;
parameter    ap_ST_st40_fsm_39 = 6'b100111;
parameter    ap_ST_st41_fsm_40 = 6'b101000;
parameter    ap_ST_st42_fsm_41 = 6'b101001;
parameter    ap_ST_st43_fsm_42 = 6'b101010;
parameter    ap_ST_st44_fsm_43 = 6'b101011;
parameter    ap_ST_st45_fsm_44 = 6'b101100;
parameter    ap_ST_st46_fsm_45 = 6'b101101;
parameter    ap_ST_st47_fsm_46 = 6'b101110;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv64_401921FB54442D18 = 64'b100000000011001001000011111101101010100010001000010110100011000;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] n;
output  [8:0] a_real_address0;
output   a_real_ce0;
output   a_real_we0;
output  [31:0] a_real_d0;
input  [31:0] a_real_q0;
output  [8:0] a_imag_address0;
output   a_imag_ce0;
output   a_imag_we0;
output  [31:0] a_imag_d0;
input  [31:0] a_imag_q0;
output  [8:0] y_real_address0;
output   y_real_ce0;
output   y_real_we0;
output  [31:0] y_real_d0;
input  [31:0] y_real_q0;
output  [8:0] y_imag_address0;
output   y_imag_ce0;
output   y_imag_we0;
output  [31:0] y_imag_d0;
input  [31:0] y_imag_q0;
input  [31:0] direction;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[8:0] a_real_address0;
reg a_real_ce0;
reg a_real_we0;
reg[8:0] a_imag_address0;
reg a_imag_ce0;
reg a_imag_we0;
reg[8:0] y_real_address0;
reg y_real_ce0;
reg y_real_we0;
reg[31:0] y_real_d0;
reg[8:0] y_imag_address0;
reg y_imag_ce0;
reg y_imag_we0;
reg[31:0] y_imag_d0;
reg   [5:0] ap_CS_fsm = 6'b000000;
wire   [63:0] grp_fu_268_p2;
reg   [63:0] reg_281;
wire   [31:0] grp_fu_257_p1;
reg   [31:0] reg_287;
wire   [31:0] grp_fu_253_p1;
wire   [31:0] tmp_fu_358_p3;
reg   [31:0] tmp_reg_496;
wire   [31:0] tmp_3_fu_366_p1;
reg   [31:0] tmp_3_reg_501;
wire   [63:0] grp_fu_262_p1;
reg   [63:0] tmp_5_reg_507;
wire   [31:0] p_1_fu_375_p2;
reg   [31:0] p_1_reg_515;
wire   [0:0] tmp_6_fu_370_p2;
wire   [31:0] tmp_7_fu_382_p2;
reg   [31:0] tmp_7_reg_521;
wire   [63:0] grp_fu_278_p1;
reg   [63:0] tmp_9_reg_526;
wire   [31:0] i_2_fu_393_p2;
reg   [31:0] i_2_reg_534;
wire   [31:0] k_fu_399_p2;
reg   [31:0] k_reg_539;
wire   [0:0] tmp_s_fu_388_p2;
reg   [63:0] tmp_1_reg_546;
wire   [63:0] grp_fu_274_p2;
reg   [63:0] tmp_8_reg_551;
reg   [63:0] x_assign_reg_556;
wire    grp_sin_cos_range_redux_cordic_fu_202_ap_done;
wire   [31:0] grp_fu_233_p2;
reg   [31:0] tmp_17_reg_587;
wire   [31:0] grp_fu_238_p2;
reg   [31:0] tmp_18_reg_592;
wire   [31:0] grp_fu_243_p2;
reg   [31:0] tmp_20_reg_597;
wire   [31:0] grp_fu_248_p2;
reg   [31:0] tmp_21_reg_602;
wire   [31:0] grp_fu_211_p2;
reg   [31:0] tmp_19_reg_607;
wire   [31:0] grp_fu_215_p2;
reg   [31:0] tmp_22_reg_613;
wire   [31:0] tmp_26_fu_438_p2;
reg   [31:0] tmp_26_reg_629;
wire   [31:0] tmp_31_fu_448_p2;
reg   [31:0] tmp_31_reg_634;
wire   [31:0] grp_fu_223_p2;
reg   [31:0] tmp_29_reg_639;
wire   [31:0] grp_fu_228_p2;
reg   [31:0] tmp_33_reg_644;
wire   [31:0] i_3_fu_469_p2;
reg   [31:0] i_3_reg_652;
wire   [63:0] tmp_35_fu_475_p1;
reg   [63:0] tmp_35_reg_657;
wire   [0:0] tmp_34_fu_464_p2;
wire    grp_sin_cos_range_redux_cordic_fu_202_ap_start;
wire    grp_sin_cos_range_redux_cordic_fu_202_ap_idle;
wire    grp_sin_cos_range_redux_cordic_fu_202_ap_ready;
wire   [63:0] grp_sin_cos_range_redux_cordic_fu_202_t_in;
wire   [63:0] grp_sin_cos_range_redux_cordic_fu_202_ap_return_0;
wire   [63:0] grp_sin_cos_range_redux_cordic_fu_202_ap_return_1;
reg   [31:0] p_reg_166;
reg   [31:0] i_reg_178;
reg   [31:0] i_1_reg_190;
reg    grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg = 1'b0;
wire   [63:0] tmp_16_fu_420_p1;
wire   [63:0] tmp_23_fu_426_p1;
wire   [63:0] tmp_27_fu_454_p1;
wire   [63:0] tmp_32_fu_459_p1;
reg   [31:0] grp_fu_211_p0;
reg   [31:0] grp_fu_211_p1;
reg   [31:0] grp_fu_215_p0;
reg   [31:0] grp_fu_215_p1;
wire   [31:0] grp_fu_223_p0;
wire   [31:0] grp_fu_223_p1;
wire   [31:0] grp_fu_228_p0;
wire   [31:0] grp_fu_228_p1;
wire   [31:0] grp_fu_233_p0;
wire   [31:0] grp_fu_233_p1;
wire   [31:0] grp_fu_238_p0;
wire   [31:0] grp_fu_238_p1;
wire   [31:0] grp_fu_243_p0;
wire   [31:0] grp_fu_243_p1;
wire   [31:0] grp_fu_248_p0;
wire   [31:0] grp_fu_248_p1;
wire   [31:0] grp_fu_253_p0;
reg   [63:0] grp_fu_257_p0;
reg   [31:0] grp_fu_262_p0;
reg   [63:0] grp_fu_268_p0;
reg   [63:0] grp_fu_268_p1;
wire   [63:0] grp_fu_274_p0;
wire   [63:0] grp_fu_274_p1;
reg   [31:0] grp_fu_278_p0;
wire   [31:0] p_neg_fu_318_p2;
wire   [30:0] p_lshr_fu_324_p4;
wire   [31:0] tmp_13_fu_334_p1;
wire   [30:0] p_lshr_f_fu_344_p4;
wire   [0:0] tmp_36_fu_310_p3;
wire   [31:0] p_neg_t_fu_338_p2;
wire   [31:0] tmp_25_fu_354_p1;
wire   [31:0] o_idx_fu_415_p2;
wire   [31:0] tmp_38_fu_432_p2;
wire   [31:0] tmp_30_fu_443_p2;
reg   [1:0] grp_fu_211_opcode;
wire    grp_fu_211_ce;
wire    grp_fu_215_ce;
wire    grp_fu_223_ce;
wire    grp_fu_228_ce;
wire    grp_fu_233_ce;
wire    grp_fu_238_ce;
wire    grp_fu_243_ce;
wire    grp_fu_248_ce;
wire    grp_fu_253_ce;
reg    grp_fu_257_ce;
wire    grp_fu_262_ce;
reg    grp_fu_268_ce;
wire    grp_fu_274_ce;
wire    grp_fu_278_ce;
reg   [5:0] ap_NS_fsm;


sin_cos_range_redux_cordic grp_sin_cos_range_redux_cordic_fu_202(
    .ap_clk( ap_clk ),
    .ap_rst( ap_rst ),
    .ap_start( grp_sin_cos_range_redux_cordic_fu_202_ap_start ),
    .ap_done( grp_sin_cos_range_redux_cordic_fu_202_ap_done ),
    .ap_idle( grp_sin_cos_range_redux_cordic_fu_202_ap_idle ),
    .ap_ready( grp_sin_cos_range_redux_cordic_fu_202_ap_ready ),
    .t_in( grp_sin_cos_range_redux_cordic_fu_202_t_in ),
    .ap_return_0( grp_sin_cos_range_redux_cordic_fu_202_ap_return_0 ),
    .ap_return_1( grp_sin_cos_range_redux_cordic_fu_202_ap_return_1 )
);

xillybus_wrapper_faddfsub_32ns_32ns_32_3_full_dsp #(
    .ID( 10 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_faddfsub_32ns_32ns_32_3_full_dsp_U10(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_211_p0 ),
    .din1( grp_fu_211_p1 ),
    .opcode( grp_fu_211_opcode ),
    .ce( grp_fu_211_ce ),
    .dout( grp_fu_211_p2 )
);

xillybus_wrapper_fadd_32ns_32ns_32_3_full_dsp #(
    .ID( 11 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fadd_32ns_32ns_32_3_full_dsp_U11(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_215_p0 ),
    .din1( grp_fu_215_p1 ),
    .ce( grp_fu_215_ce ),
    .dout( grp_fu_215_p2 )
);

xillybus_wrapper_fsub_32ns_32ns_32_3_full_dsp #(
    .ID( 12 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fsub_32ns_32ns_32_3_full_dsp_U12(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_223_p0 ),
    .din1( grp_fu_223_p1 ),
    .ce( grp_fu_223_ce ),
    .dout( grp_fu_223_p2 )
);

xillybus_wrapper_fsub_32ns_32ns_32_3_full_dsp #(
    .ID( 13 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fsub_32ns_32ns_32_3_full_dsp_U13(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_228_p0 ),
    .din1( grp_fu_228_p1 ),
    .ce( grp_fu_228_ce ),
    .dout( grp_fu_228_p2 )
);

xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp #(
    .ID( 14 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp_U14(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_233_p0 ),
    .din1( grp_fu_233_p1 ),
    .ce( grp_fu_233_ce ),
    .dout( grp_fu_233_p2 )
);

xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp #(
    .ID( 15 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp_U15(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_238_p0 ),
    .din1( grp_fu_238_p1 ),
    .ce( grp_fu_238_ce ),
    .dout( grp_fu_238_p2 )
);

xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp #(
    .ID( 16 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp_U16(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_243_p0 ),
    .din1( grp_fu_243_p1 ),
    .ce( grp_fu_243_ce ),
    .dout( grp_fu_243_p2 )
);

xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp #(
    .ID( 17 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fmul_32ns_32ns_32_3_max_dsp_U17(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_248_p0 ),
    .din1( grp_fu_248_p1 ),
    .ce( grp_fu_248_ce ),
    .dout( grp_fu_248_p2 )
);

xillybus_wrapper_sitofp_32ns_32_3 #(
    .ID( 18 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_sitofp_32ns_32_3_U18(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_253_p0 ),
    .ce( grp_fu_253_ce ),
    .dout( grp_fu_253_p1 )
);

xillybus_wrapper_fptrunc_64ns_32_3 #(
    .ID( 19 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 64 ),
    .dout_WIDTH( 32 ))
xillybus_wrapper_fptrunc_64ns_32_3_U19(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_257_p0 ),
    .ce( grp_fu_257_ce ),
    .dout( grp_fu_257_p1 )
);

xillybus_wrapper_fpext_32ns_64_3 #(
    .ID( 20 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
xillybus_wrapper_fpext_32ns_64_3_U20(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_262_p0 ),
    .ce( grp_fu_262_ce ),
    .dout( grp_fu_262_p1 )
);

xillybus_wrapper_dmul_64ns_64ns_64_4_max_dsp #(
    .ID( 21 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
xillybus_wrapper_dmul_64ns_64ns_64_4_max_dsp_U21(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_268_p0 ),
    .din1( grp_fu_268_p1 ),
    .ce( grp_fu_268_ce ),
    .dout( grp_fu_268_p2 )
);

xillybus_wrapper_ddiv_64ns_64ns_64_10 #(
    .ID( 22 ),
    .NUM_STAGE( 10 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
xillybus_wrapper_ddiv_64ns_64ns_64_10_U22(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_274_p0 ),
    .din1( grp_fu_274_p1 ),
    .ce( grp_fu_274_ce ),
    .dout( grp_fu_274_p2 )
);

xillybus_wrapper_sitodp_32ns_64_3 #(
    .ID( 23 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
xillybus_wrapper_sitodp_32ns_64_3_U23(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_278_p0 ),
    .ce( grp_fu_278_ce ),
    .dout( grp_fu_278_p1 )
);



/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg
    if (ap_rst == 1'b1) begin
        grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg <= ap_const_logic_0;
    end else begin
        if ((ap_ST_st30_fsm_29 == ap_CS_fsm)) begin
            grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg <= ap_const_logic_1;
        end else if ((ap_const_logic_1 == grp_sin_cos_range_redux_cordic_fu_202_ap_ready)) begin
            grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st9_fsm_8 == ap_CS_fsm) & (ap_const_lv1_0 == tmp_s_fu_388_p2))) begin
        i_1_reg_190 <= ap_const_lv32_0;
    end else if ((ap_ST_st47_fsm_46 == ap_CS_fsm)) begin
        i_1_reg_190 <= i_3_reg_652;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st8_fsm_7 == ap_CS_fsm)) begin
        i_reg_178 <= ap_const_lv32_0;
    end else if ((ap_ST_st45_fsm_44 == ap_CS_fsm)) begin
        i_reg_178 <= i_2_reg_534;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st46_fsm_45 == ap_CS_fsm) & (ap_const_lv1_0 == tmp_34_fu_464_p2))) begin
        p_reg_166 <= p_1_reg_515;
    end else if ((ap_ST_st5_fsm_4 == ap_CS_fsm)) begin
        p_reg_166 <= ap_const_lv32_1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st9_fsm_8 == ap_CS_fsm)) begin
        i_2_reg_534 <= i_2_fu_393_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st46_fsm_45 == ap_CS_fsm)) begin
        i_3_reg_652 <= i_3_fu_469_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st9_fsm_8 == ap_CS_fsm) & ~(ap_const_lv1_0 == tmp_s_fu_388_p2))) begin
        k_reg_539 <= k_fu_399_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st6_fsm_5 == ap_CS_fsm) & (tmp_6_fu_370_p2 == ap_const_lv1_0))) begin
        p_1_reg_515[1] <= p_1_fu_375_p2[1];
p_1_reg_515[2] <= p_1_fu_375_p2[2];
p_1_reg_515[3] <= p_1_fu_375_p2[3];
p_1_reg_515[4] <= p_1_fu_375_p2[4];
p_1_reg_515[5] <= p_1_fu_375_p2[5];
p_1_reg_515[6] <= p_1_fu_375_p2[6];
p_1_reg_515[7] <= p_1_fu_375_p2[7];
p_1_reg_515[8] <= p_1_fu_375_p2[8];
p_1_reg_515[9] <= p_1_fu_375_p2[9];
p_1_reg_515[10] <= p_1_fu_375_p2[10];
p_1_reg_515[11] <= p_1_fu_375_p2[11];
p_1_reg_515[12] <= p_1_fu_375_p2[12];
p_1_reg_515[13] <= p_1_fu_375_p2[13];
p_1_reg_515[14] <= p_1_fu_375_p2[14];
p_1_reg_515[15] <= p_1_fu_375_p2[15];
p_1_reg_515[16] <= p_1_fu_375_p2[16];
p_1_reg_515[17] <= p_1_fu_375_p2[17];
p_1_reg_515[18] <= p_1_fu_375_p2[18];
p_1_reg_515[19] <= p_1_fu_375_p2[19];
p_1_reg_515[20] <= p_1_fu_375_p2[20];
p_1_reg_515[21] <= p_1_fu_375_p2[21];
p_1_reg_515[22] <= p_1_fu_375_p2[22];
p_1_reg_515[23] <= p_1_fu_375_p2[23];
p_1_reg_515[24] <= p_1_fu_375_p2[24];
p_1_reg_515[25] <= p_1_fu_375_p2[25];
p_1_reg_515[26] <= p_1_fu_375_p2[26];
p_1_reg_515[27] <= p_1_fu_375_p2[27];
p_1_reg_515[28] <= p_1_fu_375_p2[28];
p_1_reg_515[29] <= p_1_fu_375_p2[29];
p_1_reg_515[30] <= p_1_fu_375_p2[30];
p_1_reg_515[31] <= p_1_fu_375_p2[31];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st15_fsm_14 == ap_CS_fsm) | (ap_ST_st34_fsm_33 == ap_CS_fsm))) begin
        reg_281 <= grp_fu_268_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st28_fsm_27 == ap_CS_fsm) | (ap_ST_st33_fsm_32 == ap_CS_fsm))) begin
        reg_287 <= grp_fu_257_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st38_fsm_37 == ap_CS_fsm)) begin
        tmp_17_reg_587 <= grp_fu_233_p2;
        tmp_18_reg_592 <= grp_fu_238_p2;
        tmp_20_reg_597 <= grp_fu_243_p2;
        tmp_21_reg_602 <= grp_fu_248_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st41_fsm_40 == ap_CS_fsm)) begin
        tmp_19_reg_607 <= grp_fu_211_p2;
        tmp_22_reg_613 <= grp_fu_215_p2;
        tmp_26_reg_629 <= tmp_26_fu_438_p2;
        tmp_31_reg_634 <= tmp_31_fu_448_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st11_fsm_10 == ap_CS_fsm)) begin
        tmp_1_reg_546 <= grp_fu_278_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st44_fsm_43 == ap_CS_fsm)) begin
        tmp_29_reg_639 <= grp_fu_223_p2;
        tmp_33_reg_644 <= grp_fu_228_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_ST_st46_fsm_45 == ap_CS_fsm) & ~(ap_const_lv1_0 == tmp_34_fu_464_p2))) begin
        tmp_35_reg_657 <= tmp_35_fu_475_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st5_fsm_4 == ap_CS_fsm)) begin
        tmp_3_reg_501 <= tmp_3_fu_366_p1;
        tmp_5_reg_507 <= grp_fu_262_p1;
        tmp_reg_496 <= tmp_fu_358_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st8_fsm_7 == ap_CS_fsm)) begin
        tmp_7_reg_521 <= tmp_7_fu_382_p2;
        tmp_9_reg_526 <= grp_fu_278_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st25_fsm_24 == ap_CS_fsm)) begin
        tmp_8_reg_551 <= grp_fu_274_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st30_fsm_29 == ap_CS_fsm)) begin
        x_assign_reg_556 <= grp_fu_262_p1;
    end
end

/// a_imag_address0 assign process. ///
always @ (ap_CS_fsm or tmp_35_reg_657 or tmp_16_fu_420_p1 or tmp_23_fu_426_p1)
begin
    if ((ap_ST_st47_fsm_46 == ap_CS_fsm)) begin
        a_imag_address0 = tmp_35_reg_657;
    end else if ((ap_ST_st41_fsm_40 == ap_CS_fsm)) begin
        a_imag_address0 = tmp_23_fu_426_p1;
    end else if ((ap_ST_st35_fsm_34 == ap_CS_fsm)) begin
        a_imag_address0 = tmp_16_fu_420_p1;
    end else begin
        a_imag_address0 = 'bx;
    end
end

/// a_imag_ce0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st35_fsm_34 == ap_CS_fsm) | (ap_ST_st41_fsm_40 == ap_CS_fsm) | (ap_ST_st47_fsm_46 == ap_CS_fsm))) begin
        a_imag_ce0 = ap_const_logic_1;
    end else begin
        a_imag_ce0 = ap_const_logic_0;
    end
end

/// a_imag_we0 assign process. ///
always @ (ap_CS_fsm)
begin
    if ((ap_ST_st47_fsm_46 == ap_CS_fsm)) begin
        a_imag_we0 = ap_const_logic_1;
    end else begin
        a_imag_we0 = ap_const_logic_0;
    end
end

/// a_real_address0 assign process. ///
always @ (ap_CS_fsm or tmp_35_reg_657 or tmp_16_fu_420_p1 or tmp_23_fu_426_p1)
begin
    if ((ap_ST_st47_fsm_46 == ap_CS_fsm)) begin
        a_real_address0 = tmp_35_reg_657;
    end else if ((ap_ST_st41_fsm_40 == ap_CS_fsm)) begin
        a_real_address0 = tmp_23_fu_426_p1;
    end else if ((ap_ST_st35_fsm_34 == ap_CS_fsm)) begin
        a_real_address0 = tmp_16_fu_420_p1;
    end else begin
        a_real_address0 = 'bx;
    end
end

/// a_real_ce0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st35_fsm_34 == ap_CS_fsm) | (ap_ST_st41_fsm_40 == ap_CS_fsm) | (ap_ST_st47_fsm_46 == ap_CS_fsm))) begin
        a_real_ce0 = ap_const_logic_1;
    end else begin
        a_real_ce0 = ap_const_logic_0;
    end
end

/// a_real_we0 assign process. ///
always @ (ap_CS_fsm)
begin
    if ((ap_ST_st47_fsm_46 == ap_CS_fsm)) begin
        a_real_we0 = ap_const_logic_1;
    end else begin
        a_real_we0 = ap_const_logic_0;
    end
end

/// ap_done assign process. ///
always @ (ap_start or ap_CS_fsm or tmp_6_fu_370_p2)
begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_ST_st1_fsm_0 == ap_CS_fsm)) | ((ap_ST_st6_fsm_5 == ap_CS_fsm) & ~(tmp_6_fu_370_p2 == ap_const_lv1_0)))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_CS_fsm)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_ST_st1_fsm_0 == ap_CS_fsm))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_CS_fsm or tmp_6_fu_370_p2)
begin
    if (((ap_ST_st6_fsm_5 == ap_CS_fsm) & ~(tmp_6_fu_370_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// grp_fu_211_opcode assign process. ///
always @ (ap_CS_fsm)
begin
    if ((ap_ST_st39_fsm_38 == ap_CS_fsm)) begin
        grp_fu_211_opcode = ap_const_lv2_1;
    end else if ((ap_ST_st42_fsm_41 == ap_CS_fsm)) begin
        grp_fu_211_opcode = ap_const_lv2_0;
    end else begin
        grp_fu_211_opcode = 'bx;
    end
end

/// grp_fu_211_p0 assign process. ///
always @ (ap_CS_fsm or a_real_q0 or tmp_17_reg_587)
begin
    if ((ap_ST_st42_fsm_41 == ap_CS_fsm)) begin
        grp_fu_211_p0 = a_real_q0;
    end else if ((ap_ST_st39_fsm_38 == ap_CS_fsm)) begin
        grp_fu_211_p0 = tmp_17_reg_587;
    end else begin
        grp_fu_211_p0 = 'bx;
    end
end

/// grp_fu_211_p1 assign process. ///
always @ (ap_CS_fsm or tmp_18_reg_592 or tmp_19_reg_607)
begin
    if ((ap_ST_st42_fsm_41 == ap_CS_fsm)) begin
        grp_fu_211_p1 = tmp_19_reg_607;
    end else if ((ap_ST_st39_fsm_38 == ap_CS_fsm)) begin
        grp_fu_211_p1 = tmp_18_reg_592;
    end else begin
        grp_fu_211_p1 = 'bx;
    end
end

/// grp_fu_215_p0 assign process. ///
always @ (ap_CS_fsm or a_imag_q0 or tmp_20_reg_597)
begin
    if ((ap_ST_st42_fsm_41 == ap_CS_fsm)) begin
        grp_fu_215_p0 = a_imag_q0;
    end else if ((ap_ST_st39_fsm_38 == ap_CS_fsm)) begin
        grp_fu_215_p0 = tmp_20_reg_597;
    end else begin
        grp_fu_215_p0 = 'bx;
    end
end

/// grp_fu_215_p1 assign process. ///
always @ (ap_CS_fsm or tmp_21_reg_602 or tmp_22_reg_613)
begin
    if ((ap_ST_st42_fsm_41 == ap_CS_fsm)) begin
        grp_fu_215_p1 = tmp_22_reg_613;
    end else if ((ap_ST_st39_fsm_38 == ap_CS_fsm)) begin
        grp_fu_215_p1 = tmp_21_reg_602;
    end else begin
        grp_fu_215_p1 = 'bx;
    end
end

/// grp_fu_257_ce assign process. ///
always @ (ap_CS_fsm or grp_sin_cos_range_redux_cordic_fu_202_ap_done)
begin
    if (((ap_ST_st34_fsm_33 == ap_CS_fsm) | (ap_ST_st28_fsm_27 == ap_CS_fsm) | (ap_ST_st33_fsm_32 == ap_CS_fsm) | (ap_ST_st36_fsm_35 == ap_CS_fsm) | ((ap_ST_st31_fsm_30 == ap_CS_fsm) & ~(ap_const_logic_0 == grp_sin_cos_range_redux_cordic_fu_202_ap_done)) | (ap_ST_st35_fsm_34 == ap_CS_fsm) | (ap_ST_st26_fsm_25 == ap_CS_fsm) | (ap_ST_st27_fsm_26 == ap_CS_fsm) | (ap_ST_st32_fsm_31 == ap_CS_fsm))) begin
        grp_fu_257_ce = ap_const_logic_1;
    end else begin
        grp_fu_257_ce = ap_const_logic_0;
    end
end

/// grp_fu_257_p0 assign process. ///
always @ (ap_CS_fsm or grp_fu_268_p2 or tmp_8_reg_551 or grp_sin_cos_range_redux_cordic_fu_202_ap_return_1)
begin
    if ((ap_ST_st34_fsm_33 == ap_CS_fsm)) begin
        grp_fu_257_p0 = grp_fu_268_p2;
    end else if ((ap_ST_st31_fsm_30 == ap_CS_fsm)) begin
        grp_fu_257_p0 = grp_sin_cos_range_redux_cordic_fu_202_ap_return_1;
    end else if ((ap_ST_st26_fsm_25 == ap_CS_fsm)) begin
        grp_fu_257_p0 = tmp_8_reg_551;
    end else begin
        grp_fu_257_p0 = 'bx;
    end
end

/// grp_fu_262_p0 assign process. ///
always @ (ap_CS_fsm or grp_fu_257_p1 or grp_fu_253_p1)
begin
    if ((ap_ST_st28_fsm_27 == ap_CS_fsm)) begin
        grp_fu_262_p0 = grp_fu_257_p1;
    end else if ((ap_ST_st3_fsm_2 == ap_CS_fsm)) begin
        grp_fu_262_p0 = grp_fu_253_p1;
    end else begin
        grp_fu_262_p0 = 'bx;
    end
end

/// grp_fu_268_ce assign process. ///
always @ (ap_CS_fsm or grp_sin_cos_range_redux_cordic_fu_202_ap_done)
begin
    if (((ap_ST_st15_fsm_14 == ap_CS_fsm) | (ap_ST_st34_fsm_33 == ap_CS_fsm) | (ap_ST_st33_fsm_32 == ap_CS_fsm) | ((ap_ST_st31_fsm_30 == ap_CS_fsm) & ~(ap_const_logic_0 == grp_sin_cos_range_redux_cordic_fu_202_ap_done)) | (ap_ST_st12_fsm_11 == ap_CS_fsm) | (ap_ST_st32_fsm_31 == ap_CS_fsm) | (ap_ST_st13_fsm_12 == ap_CS_fsm) | (ap_ST_st14_fsm_13 == ap_CS_fsm))) begin
        grp_fu_268_ce = ap_const_logic_1;
    end else begin
        grp_fu_268_ce = ap_const_logic_0;
    end
end

/// grp_fu_268_p0 assign process. ///
always @ (ap_CS_fsm or tmp_5_reg_507 or tmp_1_reg_546)
begin
    if ((ap_ST_st31_fsm_30 == ap_CS_fsm)) begin
        grp_fu_268_p0 = tmp_5_reg_507;
    end else if ((ap_ST_st12_fsm_11 == ap_CS_fsm)) begin
        grp_fu_268_p0 = tmp_1_reg_546;
    end else begin
        grp_fu_268_p0 = 'bx;
    end
end

/// grp_fu_268_p1 assign process. ///
always @ (ap_CS_fsm or grp_sin_cos_range_redux_cordic_fu_202_ap_return_0)
begin
    if ((ap_ST_st31_fsm_30 == ap_CS_fsm)) begin
        grp_fu_268_p1 = grp_sin_cos_range_redux_cordic_fu_202_ap_return_0;
    end else if ((ap_ST_st12_fsm_11 == ap_CS_fsm)) begin
        grp_fu_268_p1 = ap_const_lv64_401921FB54442D18;
    end else begin
        grp_fu_268_p1 = 'bx;
    end
end

/// grp_fu_278_p0 assign process. ///
always @ (ap_CS_fsm or p_1_fu_375_p2 or k_fu_399_p2)
begin
    if ((ap_ST_st9_fsm_8 == ap_CS_fsm)) begin
        grp_fu_278_p0 = k_fu_399_p2;
    end else if ((ap_ST_st6_fsm_5 == ap_CS_fsm)) begin
        grp_fu_278_p0 = p_1_fu_375_p2;
    end else begin
        grp_fu_278_p0 = 'bx;
    end
end

/// y_imag_address0 assign process. ///
always @ (ap_CS_fsm or tmp_35_fu_475_p1 or tmp_27_fu_454_p1 or tmp_32_fu_459_p1)
begin
    if ((ap_ST_st45_fsm_44 == ap_CS_fsm)) begin
        y_imag_address0 = tmp_32_fu_459_p1;
    end else if ((ap_ST_st44_fsm_43 == ap_CS_fsm)) begin
        y_imag_address0 = tmp_27_fu_454_p1;
    end else if ((ap_ST_st46_fsm_45 == ap_CS_fsm)) begin
        y_imag_address0 = tmp_35_fu_475_p1;
    end else begin
        y_imag_address0 = 'bx;
    end
end

/// y_imag_ce0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st44_fsm_43 == ap_CS_fsm) | (ap_ST_st46_fsm_45 == ap_CS_fsm) | (ap_ST_st45_fsm_44 == ap_CS_fsm))) begin
        y_imag_ce0 = ap_const_logic_1;
    end else begin
        y_imag_ce0 = ap_const_logic_0;
    end
end

/// y_imag_d0 assign process. ///
always @ (ap_CS_fsm or grp_fu_215_p2 or tmp_33_reg_644)
begin
    if ((ap_ST_st45_fsm_44 == ap_CS_fsm)) begin
        y_imag_d0 = tmp_33_reg_644;
    end else if ((ap_ST_st44_fsm_43 == ap_CS_fsm)) begin
        y_imag_d0 = grp_fu_215_p2;
    end else begin
        y_imag_d0 = 'bx;
    end
end

/// y_imag_we0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st44_fsm_43 == ap_CS_fsm) | (ap_ST_st45_fsm_44 == ap_CS_fsm))) begin
        y_imag_we0 = ap_const_logic_1;
    end else begin
        y_imag_we0 = ap_const_logic_0;
    end
end

/// y_real_address0 assign process. ///
always @ (ap_CS_fsm or tmp_35_fu_475_p1 or tmp_27_fu_454_p1 or tmp_32_fu_459_p1)
begin
    if ((ap_ST_st45_fsm_44 == ap_CS_fsm)) begin
        y_real_address0 = tmp_32_fu_459_p1;
    end else if ((ap_ST_st44_fsm_43 == ap_CS_fsm)) begin
        y_real_address0 = tmp_27_fu_454_p1;
    end else if ((ap_ST_st46_fsm_45 == ap_CS_fsm)) begin
        y_real_address0 = tmp_35_fu_475_p1;
    end else begin
        y_real_address0 = 'bx;
    end
end

/// y_real_ce0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st44_fsm_43 == ap_CS_fsm) | (ap_ST_st46_fsm_45 == ap_CS_fsm) | (ap_ST_st45_fsm_44 == ap_CS_fsm))) begin
        y_real_ce0 = ap_const_logic_1;
    end else begin
        y_real_ce0 = ap_const_logic_0;
    end
end

/// y_real_d0 assign process. ///
always @ (ap_CS_fsm or grp_fu_211_p2 or tmp_29_reg_639)
begin
    if ((ap_ST_st45_fsm_44 == ap_CS_fsm)) begin
        y_real_d0 = tmp_29_reg_639;
    end else if ((ap_ST_st44_fsm_43 == ap_CS_fsm)) begin
        y_real_d0 = grp_fu_211_p2;
    end else begin
        y_real_d0 = 'bx;
    end
end

/// y_real_we0 assign process. ///
always @ (ap_CS_fsm)
begin
    if (((ap_ST_st44_fsm_43 == ap_CS_fsm) | (ap_ST_st45_fsm_44 == ap_CS_fsm))) begin
        y_real_we0 = ap_const_logic_1;
    end else begin
        y_real_we0 = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or tmp_6_fu_370_p2 or tmp_s_fu_388_p2 or grp_sin_cos_range_redux_cordic_fu_202_ap_done or tmp_34_fu_464_p2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        ap_ST_st2_fsm_1 : 
            ap_NS_fsm = ap_ST_st3_fsm_2;
        ap_ST_st3_fsm_2 : 
            ap_NS_fsm = ap_ST_st4_fsm_3;
        ap_ST_st4_fsm_3 : 
            ap_NS_fsm = ap_ST_st5_fsm_4;
        ap_ST_st5_fsm_4 : 
            ap_NS_fsm = ap_ST_st6_fsm_5;
        ap_ST_st6_fsm_5 : 
            if (~(tmp_6_fu_370_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end
        ap_ST_st7_fsm_6 : 
            ap_NS_fsm = ap_ST_st8_fsm_7;
        ap_ST_st8_fsm_7 : 
            ap_NS_fsm = ap_ST_st9_fsm_8;
        ap_ST_st9_fsm_8 : 
            if ((ap_const_lv1_0 == tmp_s_fu_388_p2)) begin
                ap_NS_fsm = ap_ST_st46_fsm_45;
            end else begin
                ap_NS_fsm = ap_ST_st10_fsm_9;
            end
        ap_ST_st10_fsm_9 : 
            ap_NS_fsm = ap_ST_st11_fsm_10;
        ap_ST_st11_fsm_10 : 
            ap_NS_fsm = ap_ST_st12_fsm_11;
        ap_ST_st12_fsm_11 : 
            ap_NS_fsm = ap_ST_st13_fsm_12;
        ap_ST_st13_fsm_12 : 
            ap_NS_fsm = ap_ST_st14_fsm_13;
        ap_ST_st14_fsm_13 : 
            ap_NS_fsm = ap_ST_st15_fsm_14;
        ap_ST_st15_fsm_14 : 
            ap_NS_fsm = ap_ST_st16_fsm_15;
        ap_ST_st16_fsm_15 : 
            ap_NS_fsm = ap_ST_st17_fsm_16;
        ap_ST_st17_fsm_16 : 
            ap_NS_fsm = ap_ST_st18_fsm_17;
        ap_ST_st18_fsm_17 : 
            ap_NS_fsm = ap_ST_st19_fsm_18;
        ap_ST_st19_fsm_18 : 
            ap_NS_fsm = ap_ST_st20_fsm_19;
        ap_ST_st20_fsm_19 : 
            ap_NS_fsm = ap_ST_st21_fsm_20;
        ap_ST_st21_fsm_20 : 
            ap_NS_fsm = ap_ST_st22_fsm_21;
        ap_ST_st22_fsm_21 : 
            ap_NS_fsm = ap_ST_st23_fsm_22;
        ap_ST_st23_fsm_22 : 
            ap_NS_fsm = ap_ST_st24_fsm_23;
        ap_ST_st24_fsm_23 : 
            ap_NS_fsm = ap_ST_st25_fsm_24;
        ap_ST_st25_fsm_24 : 
            ap_NS_fsm = ap_ST_st26_fsm_25;
        ap_ST_st26_fsm_25 : 
            ap_NS_fsm = ap_ST_st27_fsm_26;
        ap_ST_st27_fsm_26 : 
            ap_NS_fsm = ap_ST_st28_fsm_27;
        ap_ST_st28_fsm_27 : 
            ap_NS_fsm = ap_ST_st29_fsm_28;
        ap_ST_st29_fsm_28 : 
            ap_NS_fsm = ap_ST_st30_fsm_29;
        ap_ST_st30_fsm_29 : 
            ap_NS_fsm = ap_ST_st31_fsm_30;
        ap_ST_st31_fsm_30 : 
            if (~(ap_const_logic_0 == grp_sin_cos_range_redux_cordic_fu_202_ap_done)) begin
                ap_NS_fsm = ap_ST_st32_fsm_31;
            end else begin
                ap_NS_fsm = ap_ST_st31_fsm_30;
            end
        ap_ST_st32_fsm_31 : 
            ap_NS_fsm = ap_ST_st33_fsm_32;
        ap_ST_st33_fsm_32 : 
            ap_NS_fsm = ap_ST_st34_fsm_33;
        ap_ST_st34_fsm_33 : 
            ap_NS_fsm = ap_ST_st35_fsm_34;
        ap_ST_st35_fsm_34 : 
            ap_NS_fsm = ap_ST_st36_fsm_35;
        ap_ST_st36_fsm_35 : 
            ap_NS_fsm = ap_ST_st37_fsm_36;
        ap_ST_st37_fsm_36 : 
            ap_NS_fsm = ap_ST_st38_fsm_37;
        ap_ST_st38_fsm_37 : 
            ap_NS_fsm = ap_ST_st39_fsm_38;
        ap_ST_st39_fsm_38 : 
            ap_NS_fsm = ap_ST_st40_fsm_39;
        ap_ST_st40_fsm_39 : 
            ap_NS_fsm = ap_ST_st41_fsm_40;
        ap_ST_st41_fsm_40 : 
            ap_NS_fsm = ap_ST_st42_fsm_41;
        ap_ST_st42_fsm_41 : 
            ap_NS_fsm = ap_ST_st43_fsm_42;
        ap_ST_st43_fsm_42 : 
            ap_NS_fsm = ap_ST_st44_fsm_43;
        ap_ST_st44_fsm_43 : 
            ap_NS_fsm = ap_ST_st45_fsm_44;
        ap_ST_st45_fsm_44 : 
            ap_NS_fsm = ap_ST_st9_fsm_8;
        ap_ST_st46_fsm_45 : 
            if (~(ap_const_lv1_0 == tmp_34_fu_464_p2)) begin
                ap_NS_fsm = ap_ST_st47_fsm_46;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        ap_ST_st47_fsm_46 : 
            ap_NS_fsm = ap_ST_st46_fsm_45;
        default : 
            ap_NS_fsm = 'bx;
    endcase
end
assign a_imag_d0 = y_imag_q0;
assign a_real_d0 = y_real_q0;
assign grp_fu_211_ce = ap_const_logic_1;
assign grp_fu_215_ce = ap_const_logic_1;
assign grp_fu_223_ce = ap_const_logic_1;
assign grp_fu_223_p0 = a_real_q0;
assign grp_fu_223_p1 = tmp_19_reg_607;
assign grp_fu_228_ce = ap_const_logic_1;
assign grp_fu_228_p0 = a_imag_q0;
assign grp_fu_228_p1 = tmp_22_reg_613;
assign grp_fu_233_ce = ap_const_logic_1;
assign grp_fu_233_p0 = reg_287;
assign grp_fu_233_p1 = a_real_q0;
assign grp_fu_238_ce = ap_const_logic_1;
assign grp_fu_238_p0 = grp_fu_257_p1;
assign grp_fu_238_p1 = a_imag_q0;
assign grp_fu_243_ce = ap_const_logic_1;
assign grp_fu_243_p0 = reg_287;
assign grp_fu_243_p1 = a_imag_q0;
assign grp_fu_248_ce = ap_const_logic_1;
assign grp_fu_248_p0 = grp_fu_257_p1;
assign grp_fu_248_p1 = a_real_q0;
assign grp_fu_253_ce = ap_const_logic_1;
assign grp_fu_253_p0 = direction;
assign grp_fu_262_ce = ap_const_logic_1;
assign grp_fu_274_ce = ap_const_logic_1;
assign grp_fu_274_p0 = reg_281;
assign grp_fu_274_p1 = tmp_9_reg_526;
assign grp_fu_278_ce = ap_const_logic_1;
assign grp_sin_cos_range_redux_cordic_fu_202_ap_start = grp_sin_cos_range_redux_cordic_fu_202_ap_start_ap_start_reg;
assign grp_sin_cos_range_redux_cordic_fu_202_t_in = x_assign_reg_556;
assign i_2_fu_393_p2 = (i_reg_178 + ap_const_lv32_1);
assign i_3_fu_469_p2 = (i_1_reg_190 + ap_const_lv32_1);
assign k_fu_399_p2 = (i_reg_178 & tmp_7_reg_521);
assign o_idx_fu_415_p2 = (i_reg_178 + tmp_3_reg_501);
assign p_1_fu_375_p2 = p_reg_166 << ap_const_lv32_1;
assign p_lshr_f_fu_344_p4 = {{n[ap_const_lv32_1F : ap_const_lv32_1]}};
assign p_lshr_fu_324_p4 = {{p_neg_fu_318_p2[ap_const_lv32_1F : ap_const_lv32_1]}};
assign p_neg_fu_318_p2 = (ap_const_lv32_0 - n);
assign p_neg_t_fu_338_p2 = (ap_const_lv32_0 - tmp_13_fu_334_p1);
assign tmp_13_fu_334_p1 = $unsigned(p_lshr_fu_324_p4);
assign tmp_16_fu_420_p1 = $signed(o_idx_fu_415_p2);
assign tmp_23_fu_426_p1 = $signed(i_reg_178);
assign tmp_25_fu_354_p1 = $unsigned(p_lshr_f_fu_344_p4);
assign tmp_26_fu_438_p2 = (tmp_38_fu_432_p2 - k_reg_539);
assign tmp_27_fu_454_p1 = $signed(tmp_26_reg_629);
assign tmp_30_fu_443_p2 = (p_reg_166 - k_reg_539);
assign tmp_31_fu_448_p2 = (tmp_30_fu_443_p2 + tmp_38_fu_432_p2);
assign tmp_32_fu_459_p1 = $signed(tmp_31_reg_634);
assign tmp_34_fu_464_p2 = ($signed(i_1_reg_190) < $signed(n)? 1'b1: 1'b0);
assign tmp_35_fu_475_p1 = $signed(i_1_reg_190);
assign tmp_36_fu_310_p3 = n[ap_const_lv32_1F];
assign tmp_38_fu_432_p2 = i_reg_178 << ap_const_lv32_1;
assign tmp_3_fu_366_p1 = $signed(p_lshr_f_fu_344_p4);
assign tmp_6_fu_370_p2 = ($signed(p_reg_166) > $signed(tmp_reg_496)? 1'b1: 1'b0);
assign tmp_7_fu_382_p2 = (p_reg_166 + ap_const_lv32_FFFFFFFF);
assign tmp_fu_358_p3 = ((tmp_36_fu_310_p3)? p_neg_t_fu_338_p2: tmp_25_fu_354_p1);
assign tmp_s_fu_388_p2 = ($signed(i_reg_178) < $signed(tmp_3_reg_501)? 1'b1: 1'b0);
always @ (posedge ap_clk)
begin
    p_1_reg_515[0] <= 1'b0;
end



endmodule //fft_nrvs_two_arrays

