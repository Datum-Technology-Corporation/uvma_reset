// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RESET_ST_COV_MODEL_SV__
`define __UVME_RESET_ST_COV_MODEL_SV__


/**
 * Component encapsulating Reset Self-Test Environment functional coverage model.
 */
class uvme_reset_st_cov_model_c extends uvma_reset_cov_model_c;

   `uvm_component_utils(uvme_reset_st_cov_model_c)

   covergroup reset_st_cfg_cg;
      // TODO Implement reset_st_cfg_cg
      //      Ex: abc_cpt : coverpoint cfg.abc;
      is_active_cpt : coverpoint cfg.is_active;
   endgroup : reset_st_cfg_cg

   covergroup reset_st_cntxt_cg;
      // TODO Implement reset_st_cntxt_cg
      //      Ex: abc_cpt : coverpoint cntxt.abc;
      //          xyz_cpt : coverpoint cntxt.xyz;
   endgroup : reset_st_cntxt_cg

   covergroup reset_st_seq_item_cg;
      // TODO Implement reset_st_active_seq_item_cg
      //      Ex: abc_cpt : coverpoint active_seq_item.abc;
      //          xyz_cpt : coverpoint active_seq_item.xyz;
   endgroup : reset_st_seq_item_cg

   covergroup reset_st_mon_trn_cg;
      // TODO Implement reset_st_passive_mon_trn_cg
      //      Ex: abc_cpt : coverpoint passive_mon_trn.abc;
      //          xyz_cpt : coverpoint passive_mon_trn.xyz;
   endgroup : reset_st_mon_trn_cg


   /**
    * Default constructor.
    */
   extern function new(string name="uvme_reset_st_cov_model", uvm_component parent=null);

   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_cfg()
    */
   extern virtual function void sample_cfg();

   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_cntxt()
    */
   extern virtual function void sample_cntxt();

   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_seq_item()
    */
   extern virtual function void sample_seq_item();

   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_mon_trn()
    */
   extern virtual function void sample_mon_trn();

endclass : uvme_reset_st_cov_model_c


function uvme_reset_st_cov_model_c::new(string name="uvme_reset_st_cov_model", uvm_component parent=null);

   super.new(name, parent);

   reset_st_cfg_cg      = new();
   reset_st_cntxt_cg    = new();
   reset_st_seq_item_cg = new();
   reset_st_mon_trn_cg  = new();

endfunction : new


function void uvme_reset_st_cov_model_c::sample_cfg();

  reset_st_cfg_cg.sample();

endfunction : sample_cfg


function void uvme_reset_st_cov_model_c::sample_cntxt();

   reset_st_cntxt_cg.sample();

endfunction : sample_cntxt


function void uvme_reset_st_cov_model_c::sample_mon_trn();

   reset_st_seq_item_cg.sample();

endfunction : sample_mon_trn


function void uvme_reset_st_cov_model_c::sample_seq_item();

   reset_st_mon_trn_cg.sample();

endfunction : sample_seq_item


`endif // __UVME_RESET_ST_COV_MODEL_SV__
