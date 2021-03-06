// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_RESET_ST_CLK_GEN_IF_SV__
`define __UVMT_RESET_ST_CLK_GEN_IF_SV__


/**
 * Interface providing clock and reset signals to all other interfaces used by
 * Reset VIP Self-Testing Test Bench (uvmt_reset_st_tb).
 * Managed by test cases.
 */
interface uvmt_reset_st_clk_gen_if;
   
   // Signals
   logic  clk  = 0;
   
   // State variables
   bit       clk_started = 0;
   realtime  clk_period  = 10ns;
   
   
   /**
    * Generates clk signal.
    */
   initial begin
      wait (clk_started);
      fork
         forever begin
            #(clk_period/2) clk = ~clk;
         end
      join_none
   end
   
   /**
    * Sets clock period in ps.
    */
   function void set_clk_period(realtime period);
      clk_period = period * 1ps;
   endfunction : set_clk_period
   
   /**
    * Triggers the generation of clk.
    */
   function void start_clk();
      clk_started = 1;
   endfunction : start_clk
   
endinterface : uvmt_reset_st_clk_gen_if


`endif // __UVMT_RESET_ST_CLK_GEN_IF_SV__
