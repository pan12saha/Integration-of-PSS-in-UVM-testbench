
class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  alu_agent agnt;
  alu_scoreboard scrb;
  
  function new(string name = "alu_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV_CLASS","Inside ENV constructor", UVM_HIGH)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_Class","Inside Build Phase",UVM_HIGH)
    agnt = alu_agent::type_id::create("agnt",this);
    scrb = alu_scoreboard::type_id::create("scrb",this);
  endfunction: build_phase
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_Class","Inside connect Phase",UVM_HIGH)
    
    //connecting the monitor and scoreboard
    agnt.mon.monitor_port.connect(scrb.scoreboard_port);
    
  endfunction: connect_phase
  
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("ENV_Class","Inside Run Phase",UVM_HIGH)
    //Logic
    
  endtask
endclass: alu_env
