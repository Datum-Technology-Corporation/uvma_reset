// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_BASE_SEQ_SV__
`define __UVMA_RESET_BASE_SEQ_SV__


/**
 * Abstract object from which all other Reset agent sequences must extend.
 * Subclasses must be run on Reset sequencer (uvma_reset_sqr_c) instance.
 */
class uvma_reset_base_seq_c extends uvml_seq_c #(
   .REQ(uvma_reset_seq_item_c),
   .RSP(uvma_reset_seq_item_c)
);
   
   // Agent handles
   uvma_reset_cfg_c    cfg;
   uvma_reset_cntxt_c  cntxt;
   
   
   `uvm_object_utils(uvma_reset_base_seq_c)
   `uvm_declare_p_sequencer(uvma_reset_sqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_base_seq");
   
   /**
    * Assign cfg and cntxt handles from p_sequencer.
    */
   extern task pre_start();
   
endclass : uvma_reset_base_seq_c


function uvma_reset_base_seq_c::new(string name="uvma_reset_base_seq");
   
   super.new(name);
   
endfunction : new


task uvma_reset_base_seq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


`endif // __UVMA_RESET_BASE_SEQ_SV__
