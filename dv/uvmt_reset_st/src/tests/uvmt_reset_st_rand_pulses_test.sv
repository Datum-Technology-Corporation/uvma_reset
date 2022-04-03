// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_RESET_ST_RAND_PULSES_TEST_SV__
`define __UVMT_RESET_ST_RAND_PULSES_TEST_SV__


/**
 * TODO Describe uvmt_reset_st_rand_pulses_test_c
 */
class uvmt_reset_st_rand_pulses_test_c extends uvmt_reset_st_base_test_c;

   rand uvme_reset_st_rand_pulses_vseq_c  rand_pulses_vseq;


   `uvm_component_utils(uvmt_reset_st_rand_pulses_test_c)

   /**
    * Creates rand_pulses_vseq.
    */
   extern function new(string name="uvmt_reset_st_rand_pulses_test", uvm_component parent=null);

   /**
    * Runs rand_pulses_vseq on vsequencer.
    */
   extern virtual task main_phase(uvm_phase phase);

   /**
    * TODO Describe uvmt_reset_st_rand_pulses_test_c::check_phase()
    */
   extern virtual function void check_phase(uvm_phase phase);

endclass : uvmt_reset_st_rand_pulses_test_c


function uvmt_reset_st_rand_pulses_test_c::new(string name="uvmt_reset_st_rand_pulses_test", uvm_component parent=null);

   super.new(name, parent);

   rand_pulses_vseq = uvme_reset_st_rand_pulses_vseq_c::type_id::create("rand_pulses_vseq");

endfunction : new


task uvmt_reset_st_rand_pulses_test_c::main_phase(uvm_phase phase);

   super.main_phase(phase);

   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting rand_pulses virtual sequence:\n%s", rand_pulses_vseq.sprint()), UVM_NONE)
   rand_pulses_vseq.start(vsequencer);
   `uvm_info("TEST", $sformatf("Finished rand_pulses virtual sequence:\n%s", rand_pulses_vseq.sprint()), UVM_NONE)
   phase.drop_objection(this);

endtask : main_phase


function void uvmt_reset_st_rand_pulses_test_c::check_phase(uvm_phase phase);

   super.check_phase(phase);

   if (env_cntxt.sb_cntxt.match_count != (rand_pulses_vseq.num_pulses*2)) begin
      `uvm_error("TEST", $sformatf("Scoreboard did not see the same number of matches (%0d) as reset pulses that were sent (%0d)", env_cntxt.sb_cntxt.match_count, rand_pulses_vseq.num_pulses*2))
   end

endfunction : check_phase


`endif // __UVMT_RESET_ST_RAND_PULSES_TEST_SV__
