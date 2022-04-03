// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_MON_TRN_SV__
`define __UVMA_RESET_MON_TRN_SV__


/**
 * Object rebuilt from the Reset monitor. Analog of uvma_reset_seq_item_c.
 */
class uvma_reset_mon_trn_c extends uvml_mon_trn_c;

   // Data
   uvml_edge_enum  transition; ///<

   // Metadata
   int unsigned  num_cycles; ///<
   realtime      duration  ; ///<


   `uvm_object_utils_begin(uvma_reset_mon_trn_c)
      `uvm_field_enum(uvml_edge_enum, transition, UVM_DEFAULT)
      `uvm_field_int (num_cycles, UVM_DEFAULT + UVM_DEC)
      `uvm_field_real(duration  , UVM_DEFAULT          )
   `uvm_object_utils_end


   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_mon_trn");

endclass : uvma_reset_mon_trn_c


function uvma_reset_mon_trn_c::new(string name="uvma_reset_mon_trn");

   super.new(name);

endfunction : new


`endif // __UVMA_RESET_MON_TRN_SV__
