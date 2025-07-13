

class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  `uvm_component_utils(alu_sequencer)
  
  function new(string name = "alu_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SQR_CLASS","Inside Test constructor", UVM_HIGH)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SQR_Class","Inside Build Phase",UVM_HIGH)
  endfunction: build_phase
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SQR_Class","Inside connect Phase",UVM_HIGH)
  endfunction: connect_phase
  
  
  
endclass: alu_sequencer
