// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMA_RESET_MON_TRN_LOGGER_SV__
`define __UVMA_RESET_MON_TRN_LOGGER_SV__


/**
 * Component writing Reset monitor transactions debug data to disk as plain text.
 */
class uvma_reset_mon_trn_logger_c extends uvml_logs_mon_trn_logger_c#(
   .T_TRN  (uvma_reset_mon_trn_c),
   .T_CFG  (uvma_reset_cfg_c    ),
   .T_CNTXT(uvma_reset_cntxt_c  )
);
   
   `uvm_component_utils(uvma_reset_mon_trn_logger_c)
   
   
   /**
    * Default constructor.
    */
   function new(string name="uvma_reset_mon_trn_logger", uvm_component parent=null);
      
      super.new(name, parent);
      
   endfunction : new
   
   /**
    * Writes contents of t to disk
    */
   virtual function void write(uvma_reset_mon_trn_c t);
      
      fwrite($sformatf(" %t | %t | %t |", $realtime(), t.__timestamp_start, t.__timestamp_end));
      
   endfunction : write
   
   /**
    * Writes log header to disk
    */
   virtual function void print_header();
      
      fwrite("---------------------------------------------------------------");
      fwrite("        TIME        |      ASSERTED      |     DEASSERTED     |");
      fwrite("---------------------------------------------------------------");
      
   endfunction : print_header
   
endclass : uvma_reset_mon_trn_logger_c


/**
 * Component writing RESET monitor transactions debug data to disk as JavaScript Object Notation (JSON).
 */
class uvma_reset_mon_trn_logger_json_c extends uvma_reset_mon_trn_logger_c;
   
   `uvm_component_utils(uvma_reset_mon_trn_logger_json_c)
   
   
   /**
    * Set file extension to '.json'.
    */
   function new(string name="uvma_reset_mon_trn_logger_json", uvm_component parent=null);
      
      super.new(name, parent);
      fextension = "json";
      
   endfunction : new
   
   /**
    * Writes contents of t to disk.
    */
   virtual function void write(uvma_reset_mon_trn_c t);
      
      // TODO Implement uvma_reset_mon_trn_logger_json_c::write()
      // Ex: fwrite({"{",
      //       $sformatf("\"time\":\"%0t\",", $realtime()),
      //       $sformatf("\"a\":%h,"        , t.a        ),
      //       $sformatf("\"b\":%b,"        , t.b        ),
      //       $sformatf("\"c\":%d,"        , t.c        ),
      //       $sformatf("\"d\":%h,"        , t.c        ),
      //     "},"});
      
   endfunction : write
   
   /**
    * Empty function.
    */
   virtual function void print_header();
      
      // Do nothing: JSON files do not use headers.
      
   endfunction : print_header
   
endclass : uvma_reset_mon_trn_logger_json_c


`endif // __UVMA_RESET_MON_TRN_LOGGER_SV__
