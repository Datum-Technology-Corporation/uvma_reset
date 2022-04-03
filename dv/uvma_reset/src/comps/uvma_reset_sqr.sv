// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_SQR_SV__
`define __UVMA_RESET_SQR_SV__


/**
 * Component running Reset sequences extending uvma_reset_seq_base_c.
 * Provides sequence items for uvma_reset_drv_c.
 */
class uvma_reset_sqr_c extends uvml_sqr_c #(
   .REQ(uvma_reset_seq_item_c),
   .RSP(uvma_reset_seq_item_c)
);
   
   // Objects
   uvma_reset_cfg_c    cfg;
   uvma_reset_cntxt_c  cntxt;
   
   
   `uvm_component_utils_begin(uvma_reset_sqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_sqr", uvm_component parent=null);
   
   /**
    * Ensures cfg & cntxt handles are not null
    */
   extern virtual function void build_phase(uvm_phase phase);
   
endclass : uvma_reset_sqr_c


function uvma_reset_sqr_c::new(string name="uvma_reset_sqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_reset_sqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_reset_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvma_reset_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cfg == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
endfunction : build_phase


`endif // __UVMA_RESET_SQR_SV__
