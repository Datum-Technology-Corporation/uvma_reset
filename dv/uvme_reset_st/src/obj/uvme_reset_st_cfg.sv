// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RESET_ST_CFG_SV__
`define __UVME_RESET_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running
 * Reset VIP Self-Testing Environment (uvme_reset_st_env_c)
 * components.
 */
class uvme_reset_st_cfg_c extends uvml_cfg_c;

   // Generic options
   rand bit                      enabled;
   rand uvm_active_passive_enum  is_active;
   rand bit                      scoreboarding_enabled;
   rand bit                      cov_model_enabled;
   rand bit                      trn_log_enabled;

   // Integrals
   rand uvml_reset_type_enum      reset_type;
   rand uvml_reset_polarity_enum  polarity  ;

   // Objects
   rand uvma_reset_cfg_c  active_cfg;
   rand uvma_reset_cfg_c  passive_cfg;
   rand uvml_sb_simplex_cfg_c     sb_cfg;


   `uvm_object_utils_begin(uvme_reset_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)

      `uvm_field_object(active_cfg , UVM_DEFAULT)
      `uvm_field_object(passive_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_cfg     , UVM_DEFAULT)
   `uvm_object_utils_end


   constraint defaults_cons {
      soft enabled                == 0;
      soft is_active              == UVM_PASSIVE;
      soft scoreboarding_enabled  == 1;
      soft cov_model_enabled      == 0;
      soft trn_log_enabled        == 1;
   }

   constraint agent_cfg_cons {
      active_cfg .reset_type == reset_type;
      passive_cfg.reset_type == reset_type;

      active_cfg .polarity == polarity;
      passive_cfg.polarity == polarity;

      if (enabled) {
         active_cfg .enabled == 1;
         passive_cfg.enabled == 1;
      }

      if (is_active == UVM_ACTIVE) {
         active_cfg .is_active == UVM_ACTIVE ;
         passive_cfg.is_active == UVM_PASSIVE;
      }

      if (trn_log_enabled) {
         /*soft*/ active_cfg .trn_log_enabled == 1;
         /*soft*/ passive_cfg.trn_log_enabled == 1;
      }
      else {
         active_cfg .trn_log_enabled == 0;
         passive_cfg.trn_log_enabled == 0;
      }

      if (cov_model_enabled) {
         /*soft*/ active_cfg .cov_model_enabled == 1;
         /*soft*/ passive_cfg.cov_model_enabled == 1;
      }
      else {
         active_cfg .cov_model_enabled == 0;
         passive_cfg.cov_model_enabled == 0;
      }
   }

   constraint sb_cfg_cons {
      if (scoreboarding_enabled) {
         /*soft*/ sb_cfg.enabled == 1;
      }
      else {
         sb_cfg.enabled == 0;
      }
   }


   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_reset_st_cfg");

endclass : uvme_reset_st_cfg_c


function uvme_reset_st_cfg_c::new(string name="uvme_reset_st_cfg");

   super.new(name);

   active_cfg   = uvma_reset_cfg_c     ::type_id::create("active_cfg" );
   passive_cfg  = uvma_reset_cfg_c     ::type_id::create("passive_cfg");
   sb_cfg       = uvml_sb_simplex_cfg_c::type_id::create("sb_cfg"     );

endfunction : new


`endif // __UVME_RESET_ST_CFG_SV__
