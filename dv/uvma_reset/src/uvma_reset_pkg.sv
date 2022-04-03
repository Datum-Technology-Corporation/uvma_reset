// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_PKG_SV__
`define __UVMA_RESET_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvma_reset_macros.svh"

// Interface(s)
`include "uvma_reset_if.sv"


/**
 * Encapsulates all the types needed for the Moore.io Reset UVM Agent.
 */
package uvma_reset_pkg;

   import uvm_pkg       ::*;
   import uvml_pkg      ::*;
   import uvml_logs_pkg ::*;
   import uvma_reset_pkg::*;

   // Constants / Structs / Enums
   `include "uvma_reset_tdefs.sv"
   `include "uvma_reset_constants.sv"

   // Objects
   `include "uvma_reset_cfg.sv"
   `include "uvma_reset_cntxt.sv"

   // High-level transactions
   `include "uvma_reset_mon_trn.sv"
   `include "uvma_reset_mon_trn_logger.sv"
   `include "uvma_reset_seq_item.sv"
   `include "uvma_reset_seq_item_logger.sv"

   // Agent components
   `include "uvma_reset_cov_model.sv"
   `include "uvma_reset_drv.sv"
   `include "uvma_reset_mon.sv"
   `include "uvma_reset_sqr.sv"
   `include "uvma_reset_agent.sv"

   // Sequences
   `include "uvma_reset_base_seq.sv"
   `include "uvma_reset_pulse_seq.sv"

endpackage : uvma_reset_pkg


// Modules / Checkers
`ifdef UVMA_RESET_INC_IF_CHKR
`include "uvma_reset_if_chkr.sv"
`endif


`endif // __UVMA_RESET_PKG_SV__
