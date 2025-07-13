
class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
  alu_driver drv;
  alu_monitor mon;
  alu_sequencer sqr;
  
  function new(string name = "alu_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT_CLASS","Inside Test constructor", UVM_HIGH)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_Class","Inside Build Phase",UVM_HIGH)
    drv = alu_driver::type_id::create("drv",this);
    mon = alu_monitor::type_id::create("mon",this);
    sqr = alu_sequencer::type_id::create("sqr",this);
  endfunction: build_phase
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_Class","Inside connect Phase",UVM_HIGH)
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction: connect_phase
  
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("AGENT_Class","Inside Run Phase",UVM_HIGH)
    //Logic
    
  endtask
endclass: alu_agent
