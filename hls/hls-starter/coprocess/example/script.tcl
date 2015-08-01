############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project coprocess
set_top xillybus_wrapper
add_files coprocess/example/src/main.c
add_files coprocess/example/src/xilly_debug.c
open_solution "example"
#set_part  {xc7z020clg400-1}
set_part  {xc7vx485tffg1761-2}
create_clock -period 10
config_interface -all ap_fifo -expose_global

source "./coprocess/example/directives.tcl"
csynth_design
export_design
exit
