// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_PULSE_SEQ_SV__
`define __UVMA_RESET_PULSE_SEQ_SV__


/**
 * Asserts and de-asserts reset.
 */
class uvma_reset_pulse_seq_c extends uvma_reset_base_seq_c;
   
   rand int unsigned  duration;
   
   
   `uvm_object_utils_begin(uvma_reset_pulse_seq_c)
      `uvm_field_int(duration, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft duration == uvma_reset_pulse_default_duration;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_pulse_seq");
   
   /**
    * TODO Describe uvma_reset_pulse_seq_c::body()
    */
   extern virtual task body();
   
endclass : uvma_reset_pulse_seq_c


function uvma_reset_pulse_seq_c::new(string name="uvma_reset_pulse_seq");
   
   super.new(name);
   
endfunction : new


task uvma_reset_pulse_seq_c::body();
   
   `uvm_do_with(req, {
      req.duration == local::duration;
   })
   
endtask : body


`endif // __UVMA_RESET_PULSE_SEQ_SV__
