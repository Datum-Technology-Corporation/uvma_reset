// Copyright 2021 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
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
   extern function void sample_cfg();
   
   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_cntxt()
    */
   extern function void sample_cntxt();
   
   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_seq_item()
    */
   extern function void sample_seq_item();
   
   /**
    * TODO Describe uvme_reset_st_cov_model_c::sample_mon_trn()
    */
   extern function void sample_mon_trn();
   
endclass : uvme_reset_st_cov_model_c


function uvme_reset_st_cov_model_c::new(string name="uvme_reset_st_cov_model", uvm_component parent=null);
   
   super.new(name, parent);
   
   // Build covergroups
   reset_st_cfg_cg   = new();
   reset_st_cntxt_cg = new();
   
endfunction : new


function void uvme_reset_st_cov_model_c::sample_cfg();
   
  reset_st_cfg_cg.sample();
   
endfunction : sample_cfg


function void uvme_reset_st_cov_model_c::sample_cntxt();
   
   reset_st_cntxt_cg.sample();
   
endfunction : sample_cntxt


function void uvme_reset_st_cov_model_c::sample_mon_trn();
   
   
   
endfunction : sample_mon_trn


function void uvme_reset_st_cov_model_c::sample_seq_item();
   
   
   
endfunction : sample_seq_item


`endif // __UVME_RESET_ST_COV_MODEL_SV__
