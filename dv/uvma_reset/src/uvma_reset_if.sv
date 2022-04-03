// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_IF_SV__
`define __UVMA_RESET_IF_SV__


/**
 * Encapsulates all signals and clocking of Reset interface. Used by
 * monitor and driver.
 */
interface uvma_reset_if (
   input logic clk
);
   
   // Signals
   logic/*wire*/  reset  ;
   logic/*wire*/  reset_n;
   
   
   /**
    * Used by uvma_reset_drv_c.
    */
   clocking drv_cb @(posedge clk);
      output  reset  ,
              reset_n;
   endclocking : drv_cb
   
   /**
    * Used by uvma_reset_mon_c.
    */
   clocking mon_cb @(posedge clk);
      input  reset  ,
             reset_n;
   endclocking : mon_cb
   
   modport active_mp (clocking drv_cb);
   modport passive_mp(clocking mon_cb);
   
endinterface : uvma_reset_if


`endif // __UVMA_RESET_IF_SV__
