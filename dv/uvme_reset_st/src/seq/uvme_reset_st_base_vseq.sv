// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RESET_ST_BASE_VSEQ_SV__
`define __UVME_RESET_ST_BASE_VSEQ_SV__


/**
 * Abstract object from which all other Reset virtual sequences extend.
 * Does not generate any sequence items of its own. Subclasses must be run on
 * Reset Virtual Sequencer (uvme_reset_st_vsqr_c) instance.
 */
class uvme_reset_st_base_vseq_c extends uvml_vseq_c #(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   // Environment handles
   uvme_reset_st_cfg_c    cfg;
   uvme_reset_st_cntxt_c  cntxt;
   
   
   `uvm_object_utils(uvme_reset_st_base_vseq_c)
   `uvm_declare_p_sequencer(uvme_reset_st_vsqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_reset_st_base_vseq");
   
   /**
    * Retrieve cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();
   
endclass : uvme_reset_st_base_vseq_c


function uvme_reset_st_base_vseq_c::new(string name="uvme_reset_st_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_reset_st_base_vseq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


`endif // __UVME_RESET_ST_BASE_VSEQ_SV__
