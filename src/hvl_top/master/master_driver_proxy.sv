`ifndef MASTER_DRIVER_PROXY_INCLUDED_
`define MASTER_DRIVER_PROXY_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: master_driver_proxy
// <Description of the class
//Driver is written by extending uvm_driver,uvm_driver is inherited from uvm_component, 
//Methods and TLM port (seq_item_port) are defined for communication between sequencer and driver,
//uvm_driver is a parameterized class and it is parameterized with the type of the request 
//sequence_item and the type of the response sequence_item 
//--------------------------------------------------------------------------------------------
class master_driver_proxy extends uvm_driver;
  
  //register with factory so can use create uvm_method and
  //override in future if necessary 
  
    `uvm_component_utils(master_driver_proxy)
   
    //declaring virtual interface
    //virtual spi_if.MDR_CB vif;
     virtual master_driver_bfm vbfm;
     
    //declaring handle for master agent config class 
     master_agent_config m_cfg;
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "master_driver_proxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  //extern virtual function void connect_phase(uvm_phase phase);
  //extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  //extern virtual function void start_of_simulation_phase(uvm_phase phase);
  //extern virtual task run_phase(uvm_phase phase);

endclass : master_driver_proxy

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - master_driver_proxy
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function master_driver_proxy::new(string name = "master_driver_proxy",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void master_driver_proxy::build_phase(uvm_phase phase);
  
//      if(!uvm_config_db #(master_agent_config)::get(this,"","master_agent_config",m_cfg))
//      begin
//      `uvm_fatal("TB CONFIG","cannot get() m_cfg from uvm_config");
//      end 
  super.build_phase(phase);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void master_driver_proxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
//    vbfm = m_cfg.;
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Function: end_of_elaboration_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void master_driver_proxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
endfunction  : end_of_elaboration_phase

//--------------------------------------------------------------------------------------------
// Function: start_of_simulation_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void master_driver_proxy::start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
endfunction : start_of_simulation_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task master_driver_proxy::run_phase(uvm_phase phase);

  super.run_phase(phase);
//  phase.raise_objection(this, "master_driver_proxy");

//-------------------------------------------------------
// Here waiting for reset to happen
//-------------------------------------------------------
/*
  vbfm.wait_for_reset();
    
    forever
      begin
        seq_item_port.get_next_item(req);
               data_to_dut();
        seq_item_port.item_done();
      end

  phase.drop_objection(this);
*/
endtask : run_phase

//-------------------------------------------------------
// here passing the tasks to be performed on bfm side
//-------------------------------------------------------
/*task master_driver::data_to_dut();
  always@(cpol,cphase)
  begin
    if(cs==0)
      begin 
      case{cpol,cpha}
        2'b00 : vbfm.drive_mosi_pos_miso_neg(data);
        2'b01 : vbfm.drive_mosi_neg_miso_pos(data);
        2'b10 : vbfm.drive_mosi_pos_miso_neg(data);
        2'b11 : vbfm.drive_mosi_neg_miso_pos(data);
    endcase
  end 
endtask :data_to_sample
*/
`endif

