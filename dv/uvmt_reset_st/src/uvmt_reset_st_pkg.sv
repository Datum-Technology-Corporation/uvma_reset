// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_RESET_ST_PKG_SV__
`define __UVMT_RESET_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_sb_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvme_reset_st_macros.svh"
`include "uvmt_reset_st_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_reset_st_clk_gen_if.sv"


/**
 * Encapsulates all the types and test cases for self-testing a Reset VIP.
 */
package uvmt_reset_st_pkg;

   import uvm_pkg          ::*;
   import uvml_pkg         ::*;
   import uvml_logs_pkg    ::*;
   import uvml_sb_pkg      ::*;
   import uvma_reset_pkg   ::*;
   import uvme_reset_st_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_reset_st_constants.sv"
   `include "uvmt_reset_st_tdefs.sv"

   // Sequences

   // Base test
   `include "uvmt_reset_st_test_cfg.sv"
   `include "uvmt_reset_st_base_test.sv"

   // Functional tests
   `include "uvmt_reset_st_rand_pulses_test.sv"

endpackage : uvmt_reset_st_pkg


// Module(s) / Checker(s)
`include "uvmt_reset_st_dut_wrap.sv"
`include "uvmt_reset_st_dut_chkr.sv"
`include "uvmt_reset_st_tb.sv"


`endif // __UVMT_RESET_ST_PKG_SV__
