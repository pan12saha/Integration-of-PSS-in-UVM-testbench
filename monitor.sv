class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)
  virtual alu_interface vif;
  alu_sequence_item item;
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  function new(string name = "alu_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MON_CLASS","Inside Test constructor", UVM_HIGH)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MON_Class","Inside Build Phase",UVM_LOW)
     monitor_port = new("monitor_port", this);
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))begin
      `uvm_error("MONITOR_COMPONENT_DB","Couldn't get the Virtual Interface in config_db")
    end
  endfunction: build_phase
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MON_Class","Inside connect Phase",UVM_HIGH)
  endfunction: connect_phase
  
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MON_Class","Inside Run Phase",UVM_HIGH)
    //Logic
    
    forever begin
      item = alu_sequence_item::type_id::create("item");
      wait(!vif.reset);
      //sample the interface
      @(posedge vif.clock);
      item.a = vif.a;
      item.b = vif.b;
      item.op_code = vif.op_code;
      
      //Sample the output
      @(posedge vif.clock);
      item.result = vif.result;
      
      //send the data to analysis port
      monitor_port.write(item);
      
    end
    
  endtask
endclass: alu_monitor
