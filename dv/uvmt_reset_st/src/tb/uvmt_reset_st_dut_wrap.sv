// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_RESET_ST_DUT_WRAP_SV__
`define __UVMT_RESET_ST_DUT_WRAP_SV__


/**
 * Module wrapper for Reset RTL DUT. All ports are SV interfaces.
 */
module uvmt_reset_st_dut_wrap #(
   parameter int unsigned  FIFO_DEPTH=10
) (
   uvma_reset_if  active_if,
   uvma_reset_if  passive_if
);
   reg  fifo_reset_n[FIFO_DEPTH];
   reg  fifo_reset  [FIFO_DEPTH];
   
   assign passive_if.reset_n = fifo_reset_n[FIFO_DEPTH-1];
   assign passive_if.reset   = fifo_reset  [FIFO_DEPTH-1];
   
   always@(posedge active_if.clk) begin
      for (int ii=(FIFO_DEPTH-1); ii>0; ii--) begin
         fifo_reset_n[ii] = fifo_reset_n[ii-1];
         fifo_reset  [ii] = fifo_reset  [ii-1];
      end
      fifo_reset_n[0] = active_if.reset_n;
      fifo_reset  [0] = active_if.reset  ;
   end
   
endmodule : uvmt_reset_st_dut_wrap


`endif // __UVMT_RESET_ST_DUT_WRAP_SV__
