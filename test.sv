class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
  
  
  function new(string name = "alu_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST_CLASS","Inside Test constructor", UVM_LOW)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test_Class","Inside Build Phase",UVM_LOW)
    env = alu_env::type_id::create("env",this);
  endfunction: build_phase
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Test_Class","Inside connect Phase",UVM_LOW)
  endfunction: connect_phase
  
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("Test_Class","Inside Run Phase",UVM_HIGH)
    
    phase.raise_objection(this);
    
    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.sqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.sqr);
      #10;
    end
    
    phase.drop_objection(this);
    
  endtask
endclass: alu_test
