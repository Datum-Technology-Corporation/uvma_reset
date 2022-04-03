// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_SEQ_ITEM_SV__
`define __UVMA_RESET_SEQ_ITEM_SV__


/**
 * Object created by Reset agent sequences extending uvma_reset_seq_base_c.
 */
class uvma_reset_seq_item_c extends uvml_seq_item_c;
   
   // Fields
   rand int unsigned  duration; ///< Clock cycles or picoseconds (ps), depending on agent configuration
   
   
   `uvm_object_utils_begin(uvma_reset_seq_item_c)
      `uvm_field_int(duration, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft duration == uvma_reset_pulse_default_duration;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_seq_item");
   
endclass : uvma_reset_seq_item_c


function uvma_reset_seq_item_c::new(string name="uvma_reset_seq_item");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_RESET_SEQ_ITEM_SV__
