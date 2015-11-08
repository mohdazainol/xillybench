############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2013 Xilinx Inc. All rights reserved.
############################################################
open_project coprocess_prj
set_top xillybus_wrapper
add_files ../../xilly_debug/xilly_debug.c -cflags "-I../../xilly_debug"
add_files ./src/mm_opt.c -cflags "-I../../xilly_debug"
add_files ./src/main.c -cflags "-I../../xilly_debug"

open_solution "example"
set_part {xc7vx485tffg1761-2}
create_clock -period 10 -name default
config_interface -all ap_fifo -expose_global
#source "./coprocess/example/directives.tcl"
#csim_design
csynth_design
#cosim_design -trace_level none
export_design
exit